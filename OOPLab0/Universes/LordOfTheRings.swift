//
//  LordOfTheRings.swift
//  OOPLab0
//
//  Created by Crudu Alexandra on 10.10.2024.
//

import Foundation

class LordOfTheRings: Universe {
    let name = "LordOfTheRings"
    var individuals = [Individual]()

    func isEligible(individual: Individual) -> Bool {
        // Elf classification: Check for planet, traits (Elves have no age limit)
        if let planet = individual.planet, planet == "Earth", let traits = individual.traits {
            if traits.contains("BLONDE") && traits.contains("POINTY_EARS") {
                return individual.isHumanoid == true
            }
            // Dwarf classification: Check for planet, age, traits
            if traits.contains("SHORT") && traits.contains("BULKY") {
                return individual.isHumanoid == true && (individual.age == nil || individual.age! <= 200)
            }
        }
        
        return false
    }
}
