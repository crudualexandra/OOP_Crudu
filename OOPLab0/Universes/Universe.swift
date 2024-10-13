//
//  Universe.swift
//  OOPLab0
//
//  Created by Crudu Alexandra on 10.10.2024.
//

import Foundation

protocol Universe {
    var name: String { get }
    var individuals: [Individual] { get set }
    func isEligible(individual: Individual) -> Bool
}
