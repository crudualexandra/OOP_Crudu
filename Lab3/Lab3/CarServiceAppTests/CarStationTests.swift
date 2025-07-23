//
//  CarStationTests.swift
//  CarServiceAppTests
//
//  Created by Crudu Alexandra on 30.11.2024.
//

// CarStationTests.swift
import XCTest
@testable import Lab3

class CarStationTests: XCTestCase {

    override func setUp() {
        super.setUp()
        Stats.shared.reset()
    }

    func testElectricCarWithPeopleDining() {
        let queue = ArrayQueue<Car>()
        let diningService = PeopleDinner()
        let refuelingService = ElectricStation()
        let carStation = CarStation(queue: queue, diningService: diningService, refuelingService: refuelingService)

        let car = Car(id: 1, type: "ELECTRIC", passengers: "PEOPLE", isDining: true, consumption: 30)
        carStation.addCar(car: car)
        carStation.serveCars()

        XCTAssertEqual(Stats.shared.electricCars, 1)
        XCTAssertEqual(Stats.shared.gasCars, 0)
        XCTAssertEqual(Stats.shared.peopleCount, 1)
        XCTAssertEqual(Stats.shared.robotCount, 0)
        XCTAssertEqual(Stats.shared.diningCount, 1)
        XCTAssertEqual(Stats.shared.notDiningCount, 0)
        XCTAssertEqual(Stats.shared.consumption["ELECTRIC"], 30)
    }

    func testGasCarWithRobotsNoDining() {
        let queue = LinkedListQueue<Car>()
        let refuelingService = GasStation()
        let carStation = CarStation(queue: queue, diningService: nil, refuelingService: refuelingService)

        let car = Car(id: 2, type: "GAS", passengers: "ROBOTS", isDining: false, consumption: 40)
        carStation.addCar(car: car)
        carStation.serveCars()

        XCTAssertEqual(Stats.shared.electricCars, 0)
        XCTAssertEqual(Stats.shared.gasCars, 1)
        XCTAssertEqual(Stats.shared.peopleCount, 0)
        XCTAssertEqual(Stats.shared.robotCount, 1)  // No dining service, so robot count remains 0
        XCTAssertEqual(Stats.shared.diningCount, 0)
        XCTAssertEqual(Stats.shared.notDiningCount, 1)
        XCTAssertEqual(Stats.shared.consumption["GAS"], 40)
    }

    func testElectricCarWithRobotsDining() {
        let queue = CircularBufferQueue<Car>(capacity: 10)
        let diningService = RobotDinner()
        let refuelingService = ElectricStation()
        let carStation = CarStation(queue: queue, diningService: diningService, refuelingService: refuelingService)

        let car = Car(id: 3, type: "ELECTRIC", passengers: "ROBOTS", isDining: true, consumption: 25)
        carStation.addCar(car: car)
        carStation.serveCars()

        XCTAssertEqual(Stats.shared.electricCars, 1)
        XCTAssertEqual(Stats.shared.gasCars, 0)
        XCTAssertEqual(Stats.shared.peopleCount, 0)
        XCTAssertEqual(Stats.shared.robotCount, 1)
        XCTAssertEqual(Stats.shared.diningCount, 1)
        XCTAssertEqual(Stats.shared.notDiningCount, 0)
        XCTAssertEqual(Stats.shared.consumption["ELECTRIC"], 25)
    }
}
