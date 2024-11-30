//
//  ContentView.swift
//  Lab3
//
//  Created by Crudu Alexandra on 30.11.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var inputJson: String = ""
    @State private var outputStats: String = ""
    private let semaphore = Semaphore()

    var body: some View {
        VStack(alignment: .leading) {
            Text("Car Service Application")
                .font(.title)
                .padding()

            Text("Input JSON:")
            TextEditor(text: $inputJson)
                .border(Color.gray, width: 1)
                .padding()

            Button(action: {
                processInput()
            }) {
                Text("Process Car Data")
            }
            .padding()

            ScrollView{
                Text("Output Stats:")
                Text(outputStats)
                    .padding()
            }
            Spacer()
        }
        .padding()
    }

    private func processInput() {
        // Split input by new lines
        let jsonStrings = inputJson.split(separator: "\n").map { String($0) }

        // Process each JSON string
        for jsonString in jsonStrings {
            semaphore.processCarData(jsonString: jsonString)
        }

        // Serve all cars
        semaphore.serveAllCars()

        // Get stats
        if let statsString = getStatsString() {
            outputStats = statsString
        }

        // Reset Stats for next input
        Stats.shared.reset()
    }

    private func getStatsString() -> String? {
        let statsDict: [String: Any] = [
            "ELECTRIC": Stats.shared.electricCars,
            "GAS": Stats.shared.gasCars,
            "PEOPLE": Stats.shared.peopleCount,
            "ROBOTS": Stats.shared.robotCount,
            "DINING": Stats.shared.diningCount,
            "NOT_DINING": Stats.shared.notDiningCount,
            "CONSUMPTION": Stats.shared.consumption
        ]

        if let jsonData = try? JSONSerialization.data(withJSONObject: statsDict, options: .prettyPrinted),
           let jsonString = String(data: jsonData, encoding: .utf8) {
            return jsonString
        }
        return nil
    }
}
