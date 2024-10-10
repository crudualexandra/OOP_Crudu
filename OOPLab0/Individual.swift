//
//  Individual.swift
//  OOPLab0
//
//  Created by Crudu Alexandra on 10.10.2024.
//

import Foundation

class Individual: Codable {
    let id: Int
    let isHumanoid: Bool?
    let planet: String?
    let age: Int?
    let traits: [String]?
    
    init(id: Int, isHumanoid: Bool?, planet: String?, age: Int?, traits: [String]?) {
        self.id = id
        self.isHumanoid = isHumanoid
        self.planet = planet
        self.age = age
        self.traits = traits
    }
}
