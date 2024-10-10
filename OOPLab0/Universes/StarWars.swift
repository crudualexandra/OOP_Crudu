import Foundation

class StarWars: Universe {
    let name = "StarWars"
    var individuals = [Individual]()

    func isEligible(individual: Individual) -> Bool {
        // Wookie classification: Check for planet, age, traits
        if let planet = individual.planet, planet == "Kashyyyk", let traits = individual.traits {
            return individual.isHumanoid == false && (individual.age == nil || individual.age! <= 400) && traits.contains("HAIRY") && traits.contains("TALL")
        }
        
        // Ewok classification: Check for planet, age, traits
        if let planet = individual.planet, planet == "Endor", let traits = individual.traits {
            return individual.isHumanoid == false && (individual.age == nil || individual.age! <= 60) && traits.contains("SHORT") && traits.contains("HAIRY")
        }
        
        return false
    }
}
