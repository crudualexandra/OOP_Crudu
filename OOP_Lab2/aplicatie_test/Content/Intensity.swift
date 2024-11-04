import Foundation

enum Intensity: String, CustomStringConvertible {
    case light = "Light"
    case normal = "Medium"
    case strong = "Strong"

    var description: String {
        return self.rawValue
    }
}
