//
//  CarFileReader.swift
//  Lab3
//
//  Created by Crudu Alexandra on 30.11.2024.
//

// CarFileReader.swift
import Foundation

class CarFileReader {
    private let semaphore: Semaphore
    private let queueFolderURL: URL
    private var timer: Timer?

    init(semaphore: Semaphore, queueFolderPath: String) {
        self.semaphore = semaphore
        self.queueFolderURL = URL(fileURLWithPath: queueFolderPath)
    }

    func startPolling(interval: TimeInterval) {
        timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { _ in
            self.checkForNewFiles()
        }
        RunLoop.current.add(timer!, forMode: .common)
    }

    func stopPolling() {
        timer?.invalidate()
        timer = nil
    }

    private func checkForNewFiles() {
        do {
            let fileURLs = try FileManager.default.contentsOfDirectory(at: queueFolderURL, includingPropertiesForKeys: nil)
            for fileURL in fileURLs {
                if fileURL.pathExtension == "json" {
                    processFile(at: fileURL)
                    try FileManager.default.removeItem(at: fileURL)
                }
            }
        } catch {
            print("Error reading directory: \(error)")
        }
    }

    private func processFile(at url: URL) {
        do {
            let jsonData = try Data(contentsOf: url)
            if let jsonString = String(data: jsonData, encoding: .utf8) {
                semaphore.processCarData(jsonString: jsonString)
            }
        } catch {
            print("Error processing file \(url.lastPathComponent): \(error)")
        }
    }
}
