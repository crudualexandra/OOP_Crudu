//
//  ElectricStation.swift
//  Lab3
//
//  Created by Crudu Alexandra on 30.11.2024.
//

import Foundation

// ElectricStation.swift
class ElectricStation: Refuelable {
    func refuel(carId: String) {
        print("Refueling electric car \(carId).")
        Stats.shared.incrementElectric()
    }
}

