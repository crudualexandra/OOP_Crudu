//
//  GasStation.swift
//  Lab3
//
//  Created by Crudu Alexandra on 30.11.2024.
//

import Foundation

class GasStation: Refuelable {
    func refuel(carId: String) {
        print("Refueling gas car \(carId).")
        Stats.shared.incrementGas()
    }
}
