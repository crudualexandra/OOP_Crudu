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
        var unclassified = [Individual]()
        
        for individual in individuals {
            var classified = false
            for i in 0..<universes.count {
                if universes[i].isEligible(individual: individual) {
                    universes[i].individuals.append(individual)
                    classified = true
                    break
                }
            }
            
            if !classified {
                unclassified.append(individual)
            }
        }
        
        if !unclassified.isEmpty {
            print("Unclassified individuals: \(unclassified.count)")
            for individual in unclassified {
                print("Individual ID: \(individual.id) not classified. Fields: isHumanoid = \(String(describing: individual.isHumanoid)), planet = \(String(describing: individual.planet)), age = \(String(describing: individual.age)), traits = \(String(describing: individual.traits))")
            }
        }
    }
}
