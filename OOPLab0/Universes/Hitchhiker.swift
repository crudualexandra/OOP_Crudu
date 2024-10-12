import Foundation

class Hitchhiker: Universe {
    let name = "Hitchhiker"
    var individuals = [Individual]()
    
    func isEligible(individual: Individual) -> Bool {
        // If traits exist, check for EXTRA_ARMS and EXTRA_HEAD
        if (individual.isHumanoid == nil || individual.isHumanoid!) &&
            (individual.planet == nil || individual.planet!.caseInsensitiveCompare("Betelgeuse") == .orderedSame) &&
            (individual.age == nil || (individual.age! >= 0 && individual.age! <= 100)) &&
            (individual.traits == nil || individual.traits!.contains("EXTRA_ARMS") || individual.traits!.contains("EXTRA_HEAD")) {
            individual.type = "Betelgeusian"
            return true
        }
        // Hitchhiker's Universe (Vogons)
        else if (individual.isHumanoid == nil || !individual.isHumanoid!) &&
                    (individual.planet == nil || individual.planet!.caseInsensitiveCompare("Vogsphere") == .orderedSame) &&
                    (individual.age == nil || (individual.age! >= 0 && individual.age! <= 200)) &&
                    (individual.traits == nil || individual.traits!.contains("GREEN") || individual.traits!.contains("BULKY")) {
            individual.type = "Vogons"
            return true
        }
        return false
    }
}
