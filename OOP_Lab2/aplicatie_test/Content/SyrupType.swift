enum SyrupType: String, CustomStringConvertible {
    case macadamia = "Macadamia"
    case vanilla = "Vanilla"
    case coconut = "Coconut"
    case caramel = "Caramel"
    case chocolate = "Chocolate"
    case popcorn = "Popcorn"

    var description: String {
        return self.rawValue
    }
}
