// CoffeeProtocol.swift

import Foundation

protocol CoffeeProtocol {
    var name: String { get }
    var coffeeIntensity: Intensity { get set }
    func brew() -> String
    func printDetails() -> String
    func make() -> String
    func description() -> String 
}
