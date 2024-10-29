// Display.swift

class Display {
    private var width: Int
    private var height: Int
    private var ppi: Float
    private var model: String

    init(width: Int, height: Int, ppi: Float, model: String) {
        self.width = width
        self.height = height
        self.ppi = ppi
        self.model = model
    }

    // Public methods to access the model name, if needed
    func getModel() -> String {
        return self.model
    }

    // Comparison methods
    func compareSize(with other: Display) {
        let areaSelf = self.width * self.height
        let areaOther = other.width * other.height

        if areaSelf > areaOther {
            print("\(self.model) is bigger than \(other.model).")
        } else if areaSelf < areaOther {
            print("\(other.model) is bigger than \(self.model).")
        } else {
            print("\(self.model) and \(other.model) are the same size.")
        }
    }

    func compareSharpness(with other: Display) {
        if self.ppi > other.ppi {
            print("\(self.model) is sharper than \(other.model).")
        } else if self.ppi < other.ppi {
            print("\(other.model) is sharper than \(self.model).")
        } else {
            print("\(self.model) and \(other.model) have the same sharpness.")
        }
    }

    func compareWithMonitor(with other: Display) {
        let areaSelf = self.width * self.height
        let areaOther = other.width * other.height

        if areaSelf > areaOther && self.ppi > other.ppi {
            print("\(self.model) is both bigger and sharper than \(other.model).")
        } else if areaSelf < areaOther && self.ppi < other.ppi {
            print("\(other.model) is both bigger and sharper than \(self.model).")
        } else if areaSelf > areaOther && self.ppi < other.ppi {
            print("\(self.model) is bigger but \(other.model) is sharper.")
        } else if areaSelf < areaOther && self.ppi > other.ppi {
            print("\(other.model) is bigger but \(self.model) is sharper.")
        } else {
            print("\(self.model) and \(other.model) have similar size and sharpness.")
        }
    }
}
