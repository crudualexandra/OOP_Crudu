//
//  Semaphore.swift
//  Lab3
//
//  Created by Crudu Alexandra on 30.11.2024.
//

// Semaphore.swift
import Foundation

class Semaphore {
    private var carStations: [String: CarStation] = [:]

    init() {
        setupCarStations()
    }

    private func setupCarStations() {
        // Electric Station for People
        let electricPeopleStation = CarStation(
            stationName: "Electric People Station",
            queue: ArrayQueue<Car>(),
            diningService: PeopleDinner(),
            refuelingService: ElectricStation()
        )
        carStations["ELECTRIC_PEOPLE"] = electricPeopleStation

        // Electric Station for Robots
        let electricRobotStation = CarStation(
            stationName: "Electric Robot Station",
            queue: ArrayQueue<Car>(),
            diningService: RobotDinner(),
            refuelingService: ElectricStation()
        )
        carStations["ELECTRIC_ROBOTS"] = electricRobotStation

        // Gas Station for People
        let gasPeopleStation = CarStation(
            stationName: "Gas People Station",
            queue: ArrayQueue<Car>(),
            diningService: PeopleDinner(),
            refuelingService: GasStation()
        )
        carStations["GAS_PEOPLE"] = gasPeopleStation

        // Gas Station for Robots
        let gasRobotStation = CarStation(
            stationName: "Gas Robot Station",
            queue: ArrayQueue<Car>(),
            diningService: RobotDinner(),
            refuelingService: GasStation()
        )
        carStations["GAS_ROBOTS"] = gasRobotStation
    }

    func processCarData(jsonString: String) {
        guard let data = jsonString.data(using: .utf8),
              let car = try? JSONDecoder().decode(Car.self, from: data) else {
            print("Failed to parse car data")
            return
        }
        routeCar(car)
    }

    private func routeCar(_ car: Car) {
        let key = "\(car.type)_\(car.passengers)"
        if let station = carStations[key] {
            station.addCar(car: car)
        } else {
            print("No station available for car type \(car.type) with passengers \(car.passengers)")
        }
    }

    func serveAllCars() {
        for station in carStations.values {
            station.serveCars()
        }
    }

    func getAllStations() -> [CarStation] {
        return Array(carStations.values)
    }
}
