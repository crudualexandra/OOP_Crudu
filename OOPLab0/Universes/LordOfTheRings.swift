import Foundation

class LordOfTheRings: Universe {
    let name = "LordOfTheRings"
    var individuals = [Individual]()
    
    func isEligible(individual: Individual) -> Bool {
        if (individual.isHumanoid == nil || individual.isHumanoid!) &&
            (individual.planet == nil || individual.planet!.caseInsensitiveCompare("Earth") == .orderedSame) &&
            (individual.age == nil || (individual.age == nil || individual.age! > 200)) &&
            (individual.traits == nil || individual.traits!.contains("BLONDE") || individual.traits!.contains("POINTY_EARS")) {
            
            individual.type = "Elf"
            return true
        }
        // Lord of the Rings (Dwarf)
        else if (individual.isHumanoid == nil || individual.isHumanoid!) &&
                    (individual.planet == nil || individual.planet!.caseInsensitiveCompare("Earth") == .orderedSame) &&
                    (individual.age == nil || (individual.age! >= 0 && individual.age! <= 200)) &&
                    (individual.traits == nil || individual.traits!.contains("SHORT") || individual.traits!.contains("BULKY")) {
            
            individual.type = "Dwarf"
            return true
        }
        return false
    }
}
