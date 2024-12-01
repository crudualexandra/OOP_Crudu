//
//  ContentView.swift
//  Lab3
//
//  Created by Crudu Alexandra on 30.11.2024.
//

// ContentView.swift
import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CarServiceViewModel()
    @ObservedObject var stats = Stats.shared

    var body: some View {
        NavigationView {
            VStack {
                // Display Stats at the Top
                VStack(alignment: .leading, spacing: 5) {
                    Text("Stats:")
                        .font(.headline)
                    Text("Electric Cars: \(stats.electricCars)")
                    Text("Gas Cars: \(stats.gasCars)")
                    Text("People Count: \(stats.peopleCount)")
                    Text("Robot Count: \(stats.robotCount)")
                    Text("Dining Count: \(stats.diningCount)")
                    Text("Not Dining Count: \(stats.notDiningCount)")
                    Text("Consumption:")
                    Text(" - ELECTRIC: \(stats.consumption["ELECTRIC"] ?? 0)")
                    Text(" - GAS: \(stats.consumption["GAS"] ?? 0)")
                }
                .padding()

                // Buttons
                HStack {
                    Button(action: {
                        viewModel.startProcessing()
                    }) {
                        Text("Start Processing")
                    }
                    .padding()

                    Button(action: {
                        viewModel.serveAllCars()
                    }) {
                        Text("Serve the Cars")
                    }
                    .padding()
                }

                // Scrollable List of Stations and Queues
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 10) {
                        ForEach(viewModel.stationQueues.keys.sorted(), id: \.self) { stationName in
                            Section(header: Text(stationName).font(.headline)) {
                                ForEach(viewModel.stationQueues[stationName] ?? [], id: \.id) { car in
                                    VStack(alignment: .leading) {
                                        Text("Car ID: \(car.id)")
                                        Text("Type: \(car.type)")
                                        Text("Passengers: \(car.passengers)")
                                        Text("Is Dining: \(car.isDining ? "Yes" : "No")")
                                        Text("Consumption: \(car.consumption)")
                                    }
                                    .padding(.leading)
                                }
                            }
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Car Service Application")
        }
    }
}
