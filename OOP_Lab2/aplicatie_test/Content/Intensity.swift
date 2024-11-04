enum Intensity: String, CustomStringConvertible {
    case light = "Light"
    case normal = "Normal"
    case strong = "Strong"

    var description: String {
        return self.rawValue
    }
}
