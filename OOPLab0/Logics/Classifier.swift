//
//  Classifier.swift
//  OOPLab0
//
//  Created by Crudu Alexandra on 10.10.2024.
//

import Foundation

class Classifier {
    var universes: [Universe] = [StarWars(), Marvel(), Hitchhiker(), LordOfTheRings()]

    func classifyIndividuals(_ individuals: [Individual]) {
        for individual in individuals {
            for i in 0..<universes.count {  // Loop with index to mutate array elements
                if universes[i].isEligible(individual: individual) {
                    universes[i].individuals.append(individual)
                    break  // Stop after finding the first matching universe
                }
            }
        }
    }
}
