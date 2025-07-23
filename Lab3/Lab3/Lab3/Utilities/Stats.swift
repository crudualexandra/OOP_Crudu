//
//  Stats.swift
//  Lab3
//
//  Created by Crudu Alexandra on 30.11.2024.
//

// Stats.swift
import Foundation

class Stats: ObservableObject {
    static let shared = Stats()

    @Published private(set) var electricCars = 0
    @Published private(set) var gasCars = 0
    @Published private(set) var peopleCount = 0
    @Published private(set) var robotCount = 0
    @Published private(set) var diningCount = 0
    @Published private(set) var notDiningCount = 0
    @Published private(set) var consumption: [String: Int] = ["ELECTRIC": 0, "GAS": 0]

    private let lock = NSLock()

    func incrementElectric() {
        lock.lock()
        DispatchQueue.main.async {
            self.electricCars += 1
        }
        lock.unlock()
    }

    func incrementGas() {
        lock.lock()
        DispatchQueue.main.async {
            self.gasCars += 1
        }
        lock.unlock()
    }

    func incrementPeople() {
        lock.lock()
        DispatchQueue.main.async {
            self.peopleCount += 1
        }
        lock.unlock()
    }

    func incrementRobots() {
        lock.lock()
        DispatchQueue.main.async {
            self.robotCount += 1
        }
        lock.unlock()
    }

    func incrementDining() {
        lock.lock()
        DispatchQueue.main.async {
            self.diningCount += 1
        }
        lock.unlock()
    }

    func incrementNotDining() {
        lock.lock()
        DispatchQueue.main.async {
            self.notDiningCount += 1
        }
        lock.unlock()
    }

    func addConsumption(type: String, amount: Int) {
        lock.lock()
        DispatchQueue.main.async {
            if self.consumption[type] != nil {
                self.consumption[type]! += amount
            }
        }
        lock.unlock()
    }

    func reset() {
        lock.lock()
        DispatchQueue.main.async {
            self.electricCars = 0
            self.gasCars = 0
            self.peopleCount = 0
            self.robotCount = 0
            self.diningCount = 0
            self.notDiningCount = 0
            self.consumption = ["ELECTRIC": 0, "GAS": 0]
        }
        lock.unlock()
    }
}
