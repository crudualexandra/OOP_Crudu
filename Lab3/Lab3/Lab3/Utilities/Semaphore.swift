//
//  Semaphore.swift
//  Lab3
//
//  Created by Crudu Alexandra on 30.11.2024.
//

import Foundation
// Semaphore.swift
class Semaphore {
    private var carStations: [String: Any] = [:] // Dictionary to hold different CarStations

    init() {
        setupCarStations()
    }

    private func setupCarStations() {
        // Create CarStations for each combination as needed

        // Electric CarStation for PEOPLE
        let electricPeopleQueue = ArrayQueue<Car>()
        let electricPeopleDining = PeopleDinner()
        let electricStation = ElectricStation()
        let electricPeopleStation = CarStation(queue: electricPeopleQueue, diningService: electricPeopleDining, refuelingService: electricStation)

        carStations["ELECTRIC_PEOPLE"] = electricPeopleStation

        // Electric CarStation for ROBOTS
        let electricRobotsQueue = ArrayQueue<Car>()
        let electricRobotsDining = RobotDinner()
        let electricRobotsStation = CarStation(queue: electricRobotsQueue, diningService: electricRobotsDining, refuelingService: electricStation)

        carStations["ELECTRIC_ROBOTS"] = electricRobotsStation

        // Gas CarStation for PEOPLE
        let gasPeopleQueue = ArrayQueue<Car>()
        let gasPeopleDining = PeopleDinner()
        let gasStation = GasStation()
        let gasPeopleStation = CarStation(queue: gasPeopleQueue, diningService: gasPeopleDining, refuelingService: gasStation)

        carStations["GAS_PEOPLE"] = gasPeopleStation

        // Gas CarStation for ROBOTS
        let gasRobotsQueue = ArrayQueue<Car>()
        let gasRobotsDining = RobotDinner()
        let gasRobotsStation = CarStation(queue: gasRobotsQueue, diningService: gasRobotsDining, refuelingService: gasStation)

        carStations["GAS_ROBOTS"] = gasRobotsStation
    }

    func processCarData(jsonString: String) {
        // Parse the JSON string to create a Car object
        if let data = jsonString.data(using: .utf8) {
            do {
                if let carDict = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    if let car = parseCar(from: carDict) {
                        routeCar(car)
                    }
                }
            } catch {
                print("Error parsing JSON: \(error)")
            }
        }
    }

    private func parseCar(from dict: [String: Any]) -> Car? {
        guard
            let id = dict["id"] as? Int,
            let type = dict["type"] as? String,
            let passengers = dict["passengers"] as? String,
            let isDining = dict["isDining"] as? Bool,
            let consumption = dict["consumption"] as? Int
        else {
            return nil
        }
        return Car(id: id, type: type, passengers: passengers, isDining: isDining, consumption: consumption)
    }

    private func routeCar(_ car: Car) {
        let key = "\(car.type)_\(car.passengers)"
        if let station = carStations[key] as? CarStation<ArrayQueue<Car>> {
            station.addCar(car: car)
        } else {
            // Handle cases where there's no specific station for the car
            print("No station available for car type \(car.type) with passengers \(car.passengers)")
        }
    }

    func serveAllCars() {
        for station in carStations.values {
            if let carStation = station as? CarStation<ArrayQueue<Car>> {
                carStation.serveCars()
            }
        }
    }
}
