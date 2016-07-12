

import UIKit

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
    var numberOfDoors: Int { return 4 }
    var hasFlatbed: Bool { return false }
}

// Add a new initializer without losing the default memberwise initializer
extension Car {
    init(carMake: String, carModel: String, carYear: Int) {
        self.init(make: carMake,
                  model: carModel,
                  year: carYear,
                  color: "Black",
                  nickname: "N/A",
                  gasLevel: 1.0)
    }
}


var c = Car(carMake: "Ford", carModel: "Fusion", carYear: 2013)
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
        gasLevel -= amount
    }
    
    mutating func fillGas() {
        gasLevel = 1.0
    }
}

c.emptyGas(0.3)
c.gasLevel
c.fillGas()
c.gasLevel