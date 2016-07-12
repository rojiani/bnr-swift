///
/// Ch. 21 - Extensions
/// Challenges

/* Bronze Challenge 1 */
extension Int {
    var timesFive: Int {
        return self * 5
    }
}

5.timesFive


/* Bronze Challenge 2 */
typealias Velocity = Double

/* Can add computed properties, but not stored properties */
extension Velocity {
    var kph: Velocity { return self * 1.60934 }
    var mph: Velocity { return self }
}

// Note: Extensions also available on aliased type
let speed: Double = 90.0
print(speed.mph)
print(speed.kph)


protocol VehicleType {
    var topSpeed: Velocity { get }
    var numberOfDoors: Int { get }
    var hasFlatbed: Bool { get }
}

struct Car {
    let make: String
    let model: String
    let year: Int
    let numberOfDoors: Int
    let color: String
    let nickname: String
    var gasLevel: Double {
        // “If you don’t need to compute the property but still need to provide code that is run before
        //  and after setting a new value, use willSet and didSet"
        willSet {
            precondition(newValue <= 1.0 && newValue >= 0.0,
                         "New value must be between 0 and 1.")
        }
    }
}

// Use extensions to add protocol conformance
extension Car: VehicleType {
    var topSpeed: Velocity { return 180 }
    var hasFlatbed: Bool { return false }
}

// Add a new initializer without losing the default memberwise initializer
extension Car {
    init(carMake: String, carModel: String, carYear: Int, doors: Int) {
        self.init(make: carMake,
                  model: carModel,
                  year: carYear,
                  numberOfDoors: doors,
                  color: "Black",
                  nickname: "N/A",
                  gasLevel: 1.0)
    }
}


var c = Car(carMake: "Ford", carModel: "Fusion", carYear: 2013, doors: 4)
print(c)


// For categorizing the type of car
extension Car {
    enum CarKind: CustomStringConvertible {
        case Coupe, Sedan
        var description: String {
            switch self {
            case .Coupe:
                return "Coupe"
            case .Sedan:
                return "Sedan"
            }
        }
    }
    
    var kind: CarKind {
        if numberOfDoors == 2 {
            return .Coupe
        } else {
            return .Sedan
        }
    }
}

print(c.kind.description)

extension Car {
    mutating func emptyGas(amount: Double) {
        precondition(amount <= 1 && amount > 0,
                     "Amount to remove must be between 0 and 1.")
        if gasLevel >= amount {
            gasLevel -= amount
        } else {
            gasLevel = 0
        }
    }
    
    mutating func fillGas() {
        gasLevel = 1.0
    }
}

c.emptyGas(0.3)
c.gasLevel
c.fillGas()
c.gasLevel

/* Bronze Challenge 2 */
let miata = Car(carMake: "Mazda", carModel: "Miata", carYear: 1999, doors: 2)
print(miata.kind)
print(c.kind)

/* Silver Challenge */
c.gasLevel
c.emptyGas(1.0)
c.gasLevel
c.fillGas()
c.gasLevel
c.emptyGas(0.5)
c.gasLevel
c.emptyGas(0.7)
c.gasLevel