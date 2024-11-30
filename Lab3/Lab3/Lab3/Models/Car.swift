//
//  Car.swift
//  Lab3
//
//  Created by Crudu Alexandra on 30.11.2024.
//

import Foundation

class Car {
    let id: Int
    let type: String       // "ELECTRIC" or "GAS"
    let passengers: String // "PEOPLE" or "ROBOTS"
    let isDining: Bool
    let consumption: Int   // Consumption amount

    init(id: Int, type: String, passengers: String, isDining: Bool, consumption: Int) {
        self.id = id
        self.type = type
        self.passengers = passengers
        self.isDining = isDining
        self.consumption = consumption
    }
}
