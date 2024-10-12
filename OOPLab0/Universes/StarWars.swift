import Foundation

class StarWars: Universe {
    let name = "StarWars"
    var individuals = [Individual]()
    
    func isEligible(individual: Individual) -> Bool {
        
        if (individual.isHumanoid == nil || !individual.isHumanoid!) &&
            (individual.planet == nil || individual.planet!.caseInsensitiveCompare("Kashyyyk") == .orderedSame) &&
            (individual.age == nil || (individual.age! >= 0 && individual.age! <= 400)) &&
            (individual.traits == nil || individual.traits!.contains("HAIRY") || individual.traits!.contains("TALL")) {
            
            individual.type = "Wookie"
            return true
        }
        // Star Wars (Ewok)
        else if (individual.isHumanoid == nil || !individual.isHumanoid!) &&
                    (individual.planet == nil || individual.planet!.caseInsensitiveCompare("Endor") == .orderedSame) &&
                    (individual.age == nil || (individual.age! >= 0 && individual.age! <= 60)) &&
                    (individual.traits == nil || individual.traits!.contains("SHORT") || individual.traits!.contains("HAIRY")) {
            
            individual.type = "Ewok"
            return true
        }
        
        return false
        
    }
}
