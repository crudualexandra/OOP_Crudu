//
//  Stats.swift
//  Lab3
//
//  Created by Crudu Alexandra on 30.11.2024.
//

import Foundation

// Stats.swift
class Stats {
    static let shared = Stats()

    private(set) var electricCars = 0
    private(set) var gasCars = 0
    private(set) var peopleCount = 0
    private(set) var robotCount = 0
    private(set) var diningCount = 0
    private(set) var notDiningCount = 0
    private(set) var consumption: [String: Int] = ["ELECTRIC": 0, "GAS": 0]

    private init() {}

    func incrementElectric() {
        electricCars += 1
    }

    func incrementGas() {
        gasCars += 1
    }

    func incrementPeople() {
        peopleCount += 1
    }

    func incrementRobots() {
        robotCount += 1
    }

    func incrementDining() {
        diningCount += 1
    }

    func incrementNotDining() {
        notDiningCount += 1
    }

    func addConsumption(type: String, amount: Int) {
        if consumption[type] != nil {
            consumption[type]! += amount
        }
    }

    func reset() {
        electricCars = 0
        gasCars = 0
        peopleCount = 0
        robotCount = 0
        diningCount = 0
        notDiningCount = 0
        consumption = ["ELECTRIC": 0, "GAS": 0]
    }

    func printStats() {
        let statsDict: [String: Any] = [
            "ELECTRIC": electricCars,
            "GAS": gasCars,
            "PEOPLE": peopleCount,
            "ROBOTS": robotCount,
            "DINING": diningCount,
            "NOT_DINING": notDiningCount,
            "CONSUMPTION": consumption
        ]
        if let jsonData = try? JSONSerialization.data(withJSONObject: statsDict, options: .prettyPrinted) {
            if let jsonString = String(data: jsonData, encoding: .utf8) {
                print(jsonString)
            }
        }
    }
}
