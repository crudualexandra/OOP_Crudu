//
//  SemaphoreTests.swift
//  CarServiceAppTests
//
//  Created by Crudu Alexandra on 30.11.2024.
//

// SemaphoreTests.swift
import XCTest
@testable import Lab3

class SemaphoreTests: XCTestCase {

    override func setUp() {
        super.setUp()
        Stats.shared.reset()
    }

    func testSemaphoreRouting() {
        let semaphore = Semaphore()

        let sampleJsonStrings = [
            """
            {"id": 1, "type": "ELECTRIC", "passengers": "PEOPLE", "isDining": true, "consumption": 30}
            """,
            """
            {"id": 2, "type": "GAS", "passengers": "ROBOTS", "isDining": false, "consumption": 40}
            """,
            """
            {"id": 3, "type": "ELECTRIC", "passengers": "ROBOTS", "isDining": true, "consumption": 25}
            """,
            """
            {"id": 4, "type": "GAS", "passengers": "PEOPLE", "isDining": true, "consumption": 35}
            """
        ]

        // Process each sample JSON string
        for jsonString in sampleJsonStrings {
            semaphore.processCarData(jsonString: jsonString)
        }

        // Serve all cars
        semaphore.serveAllCars()

        // Assertions
        XCTAssertEqual(Stats.shared.electricCars, 2)
        XCTAssertEqual(Stats.shared.gasCars, 2)
        XCTAssertEqual(Stats.shared.peopleCount, 2)
        XCTAssertEqual(Stats.shared.robotCount, 2)
        XCTAssertEqual(Stats.shared.diningCount, 3)
        XCTAssertEqual(Stats.shared.notDiningCount, 1)
        XCTAssertEqual(Stats.shared.consumption["ELECTRIC"], 55)
        XCTAssertEqual(Stats.shared.consumption["GAS"], 75)

        // Optionally, print the stats
        Stats.shared.printStats()
    }
}
