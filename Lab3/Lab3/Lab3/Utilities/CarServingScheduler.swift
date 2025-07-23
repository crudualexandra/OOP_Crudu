//
//  CarServingScheduler.swift
//  Lab3
//
//  Created by Crudu Alexandra on 30.11.2024.
//

// CarServingScheduler.swift
import Foundation

class CarServingScheduler {
    private let carStations: [Any]
    private var timer: Timer?

    init(carStations: [Any]) {
        self.carStations = carStations
    }

    func startServing(interval: TimeInterval) {
        timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { _ in
            self.serveCars()
        }
        RunLoop.current.add(timer!, forMode: .common)
    }

    func stopServing() {
        timer?.invalidate()
        timer = nil
    }

    private func serveCars() {
        for station in carStations {
            if let carStation = station as? CarStation {
                carStation.serveCars()
            }
            // Add additional casts if using other Queue types
        }
    }
}
