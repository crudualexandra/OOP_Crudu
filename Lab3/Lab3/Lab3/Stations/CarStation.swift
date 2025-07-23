//
//  CarStation.swift
//  Lab3
//
//  Created by Crudu Alexandra on 30.11.2024.
//
// CarStation.swift
import Foundation

class CarStation {
    private let stationName: String
    private let diningService: Dineable?
    private let refuelingService: Refuelable
    private var queue: ArrayQueue<Car>
    private let dispatchQueue = DispatchQueue(label: "CarStationQueue", attributes: .concurrent)

    init(stationName: String, queue: ArrayQueue<Car>, diningService: Dineable?, refuelingService: Refuelable) {
        self.stationName = stationName
        self.queue = queue
        self.diningService = diningService
        self.refuelingService = refuelingService
    }

    func addCar(car: Car) {
        dispatchQueue.async(flags: .barrier) {
            self.queue.enqueue(car)
        }
    }

    func serveCars() {
        dispatchQueue.async(flags: .barrier) {
            while !self.queue.isEmpty() {
                if let car = self.queue.dequeue() {
                    self.refuelingService.refuel(carId: String(car.id))
                    Stats.shared.addConsumption(type: car.type, amount: car.consumption)
                    if car.type == "ELECTRIC" {
                        Stats.shared.incrementElectric()
                    } else if car.type == "GAS" {
                        Stats.shared.incrementGas()
                    }

                    if car.isDining {
                        self.diningService?.serveDinner(carId: String(car.id))
                        Stats.shared.incrementDining()
                    } else {
                        Stats.shared.incrementNotDining()
                    }

                    if car.passengers == "PEOPLE" {
                        Stats.shared.incrementPeople()
                    } else if car.passengers == "ROBOTS" {
                        Stats.shared.incrementRobots()
                    }
                }
            }
        }
    }

    func getQueueContents() -> [Car] {
        dispatchQueue.sync {
            return self.queue.getElements()
        }
    }

    func getStationName() -> String {
        return stationName
    }
}
