import Foundation

class Marvel: Universe {
    let name = "Marvel"
    var individuals = [Individual]()
    
    func isEligible(individual: Individual) -> Bool {
        
        if (individual.isHumanoid == nil || individual.isHumanoid!) &&
            (individual.planet == nil || individual.planet!.caseInsensitiveCompare("Asgard") == .orderedSame) &&
            (individual.age == nil || (individual.age! >= 0 && individual.age! <= 5000)) &&
            (individual.traits == nil || individual.traits!.contains("BLONDE") || individual.traits!.contains("TALL")) {
            
            individual.type = "Asgardian"
            return true
        }
        return false
    }
}
