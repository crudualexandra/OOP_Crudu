import Foundation

class FileHandler {
    func readInput() -> [Individual]? {
        // Accessing the input.json in the current working directory
        let currentDirectoryURL = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
        let inputFile = currentDirectoryURL.appendingPathComponent("input.json")
        
        let decoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: inputFile)
            let decodedData = try decoder.decode([String: [Individual]].self, from: data)
            return decodedData["data"]
        } catch {
            print("Error reading input file: \(error)")
            return nil
        }
    }
    
    func writeOutput(universes: [Universe]) {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        
        for universe in universes {
            let outputFilePath = FileManager.default.currentDirectoryPath + "/\(universe.name).json"
            do {
                let jsonData = try encoder.encode(universe.individuals)
                try jsonData.write(to: URL(fileURLWithPath: outputFilePath))
                print("Successfully wrote to \(outputFilePath)")
            } catch {
                print("Error writing to file \(outputFilePath): \(error)")
            }
        }
    }
}
