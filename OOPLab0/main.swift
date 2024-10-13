//
//  main.swift
//  OOPLab0
//
//  Created by Crudu Alexandra on 10.10.2024.
//

import Foundation

let fileHandler = FileHandler()
let classifier = Classifier()

if let individuals = fileHandler.readInput() {
    classifier.classifyIndividuals(individuals)
    fileHandler.writeOutput(universes: classifier.universes)
} else {
    print("Failed to read input data.")
}
