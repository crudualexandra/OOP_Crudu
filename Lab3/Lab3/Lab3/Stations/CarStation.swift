//
//  CarStation.swift
//  Lab3
//
//  Created by Crudu Alexandra on 30.11.2024.
//

// CarStation.swift
class CarStation<Q: Queue> where Q.Element == Car {
    private let diningService: Dineable?
    private let refuelingService: Refuelable
    private var queue: Q

    init(queue: Q, diningService: Dineable?, refuelingService: Refuelable) {
        self.queue = queue
        self.diningService = diningService
        self.refuelingService = refuelingService
    }

    func addCar(car: Car) {
        queue.enqueue(car)
    }

    func serveCars() {
        while !queue.isEmpty() {
            if let car = queue.dequeue() {
                // Incrementing passenger counts
                if car.passengers == "PEOPLE" {
                    Stats.shared.incrementPeople()
                } else if car.passengers == "ROBOTS" {
                    Stats.shared.incrementRobots()
                }

                // Incrementing fuel type counts (if not already incremented elsewhere)
                // If refuel methods are incrementing counts, you can skip this

                // Refuel the car
                refuelingService.refuel(carId: String(car.id))
                Stats.shared.addConsumption(type: car.type, amount: car.consumption)

                // Handle dining
                if car.isDining, let diningService = diningService {
                    Stats.shared.incrementDining()
                    diningService.serveDinner(carId: String(car.id))
                } else {
                    Stats.shared.incrementNotDining()
                }
            }
        }
    }

}
