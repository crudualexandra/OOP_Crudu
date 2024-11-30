//
//  RobotDinner.swift
//  Lab3
//
//  Created by Crudu Alexandra on 30.11.2024.
//

import Foundation

class RobotDinner: Dineable {
    func serveDinner(carId: String) {
        print("Serving dinner to robots in car \(carId).")
        Stats.shared.incrementDining()
        Stats.shared.incrementRobots()
    }
}
