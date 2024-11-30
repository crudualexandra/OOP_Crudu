// ServiceTests.swift
import XCTest
@testable import Lab3

class ServiceTests: XCTestCase {

    override func setUp() {
        super.setUp()
        Stats.shared.reset()
    }

    func testPeopleDinner() {
        let peopleDinner = PeopleDinner()
        peopleDinner.serveDinner(carId: "1")
        XCTAssertEqual(Stats.shared.diningCount, 1)
        XCTAssertEqual(Stats.shared.peopleCount, 1)
        XCTAssertEqual(Stats.shared.robotCount, 0)
    }

    func testRobotDinner() {
        let robotDinner = RobotDinner()
        robotDinner.serveDinner(carId: "2")
        XCTAssertEqual(Stats.shared.diningCount, 1)
        XCTAssertEqual(Stats.shared.robotCount, 1)
        XCTAssertEqual(Stats.shared.peopleCount, 0)
    }

    func testElectricStation() {
        let electricStation = ElectricStation()
        electricStation.refuel(carId: "3")
        XCTAssertEqual(Stats.shared.electricCars, 1)
        XCTAssertEqual(Stats.shared.gasCars, 0)
    }

    func testGasStation() {
        let gasStation = GasStation()
        gasStation.refuel(carId: "4")
        XCTAssertEqual(Stats.shared.gasCars, 1)
        XCTAssertEqual(Stats.shared.electricCars, 0)
    }
}
