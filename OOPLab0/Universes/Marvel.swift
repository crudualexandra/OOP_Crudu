import Foundation

class Marvel: Universe {
    let name = "Marvel"
    var individuals = [Individual]()

    func isEligible(individual: Individual) -> Bool {
        // Asgardian classification: Check for planet, age, traits
        if let planet = individual.planet, planet == "Asgard", let traits = individual.traits {
            return individual.isHumanoid == true && (individual.age == nil || individual.age! <= 5000) && traits.contains("BLONDE") && traits.contains("TALL")
        }
        
        return false
    }
}
