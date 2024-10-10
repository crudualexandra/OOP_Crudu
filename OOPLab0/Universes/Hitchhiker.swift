import Foundation

class Hitchhiker: Universe {
    let name = "Hitchhiker"
    var individuals = [Individual]()

    func isEligible(individual: Individual) -> Bool {
        // Betelgeusian classification: Check for planet, age, traits
        if let planet = individual.planet, planet == "Betelgeuse", let traits = individual.traits {
            return individual.isHumanoid == true && (individual.age == nil || individual.age! <= 100) && traits.contains("EXTRA_ARMS") && traits.contains("EXTRA_HEAD")
        }
        
        // Vogon classification: Check for planet, age, traits
        if let planet = individual.planet, planet == "Vogsphere", let traits = individual.traits {
            return individual.isHumanoid == false && (individual.age == nil || individual.age! <= 200) && traits.contains("GREEN") && traits.contains("BULKY")
        }
        
        return false
    }
}
