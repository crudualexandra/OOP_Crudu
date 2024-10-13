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
    var type: String?  

    init(id: Int, isHumanoid: Bool?, planet: String?, age: Int?, traits: [String]?, type: String? = nil) {
        self.id = id
        self.isHumanoid = isHumanoid
        self.planet = planet
        self.age = age
        self.traits = traits
        self.type = type
    }
}
