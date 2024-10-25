// FileReader.swift

import Foundation

class FileReader {
    func readFileIntoString(_ path: String) -> String? {
        do {
            let fileContents = try String(contentsOfFile: path, encoding: .utf8)
            return fileContents
        } catch {
            print("Error reading file at \(path): \(error.localizedDescription)")
            return nil
        }
    }
}
