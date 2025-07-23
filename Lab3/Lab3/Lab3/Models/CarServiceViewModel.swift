//
//  CarServiceViewModel.swift
//  Lab3
//
//  Created by Crudu Alexandra on 30.11.2024.
//
import Foundation
import SwiftUI

class CarServiceViewModel: ObservableObject {
    @Published var stationQueues: [String: [Car]] = [:]
    @Published var stats = Stats.shared
    private let semaphore = Semaphore()
    private var carFileReader: CarFileReader?
    private let queueFolderPath = "/Users/crudualexandra/Desktop/OOP_Crudu/Lab3/queue" // Update with the actual path
    private let pollingInterval: TimeInterval = 2.0 // Read files every 2 seconds

    func startProcessing() {
        carFileReader = CarFileReader(semaphore: semaphore, queueFolderPath: queueFolderPath)
        carFileReader?.startPolling(interval: pollingInterval)
        startUpdatingQueues(interval: 1.0)
    }

    func stopProcessing() {
        carFileReader?.stopPolling()
        stopUpdatingQueues()
    }

    func serveAllCars() {
        semaphore.serveAllCars()
        updateStationQueues()
        // Update stats after serving
        DispatchQueue.main.async {
            self.stats = Stats.shared
        }
    }

    // Timer to update station queues
    private var queueUpdateTimer: Timer?

    private func startUpdatingQueues(interval: TimeInterval) {
        queueUpdateTimer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { _ in
            self.updateStationQueues()
        }
        RunLoop.current.add(queueUpdateTimer!, forMode: .common)
    }

    private func stopUpdatingQueues() {
        queueUpdateTimer?.invalidate()
        queueUpdateTimer = nil
    }

    func updateStationQueues() {
        var queues: [String: [Car]] = [:]
        for station in semaphore.getAllStations() {
            let stationName = station.getStationName()
            let cars = station.getQueueContents()
            queues[stationName] = cars
        }
        DispatchQueue.main.async {
            self.stationQueues = queues
        }
    }
}
