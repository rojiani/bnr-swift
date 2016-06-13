/* Enum Methods, p. 237 */

import UIKit

enum Lightbulb {
    case On
    case Off
    
    func surfaceTemperatureForAmbientTemperature(ambient: Double) -> Double {
        // When an instance of the enum calls a method defined in the enum,
        // 'self' is the case of the instance of the enum.
        // print(self) would
        switch self {
        case .On:
            return ambient + 150.0
            
        case .Off:
            return ambient
        }
    }
    
    // must be marked 'mutating' 
    mutating func toggle() {
        switch self {
        case .On:
            self = .Off
            
        case .Off:
            self = .On
        }
    }
}

var bulb = Lightbulb.On
let ambientTemperature = 77.0


// syntax:
// instance.methodName(parameters)
var bulbTemperature = bulb.surfaceTemperatureForAmbientTemperature(ambientTemperature)
print("the bulb's temperature when \(bulb) is \(bulbTemperature)")

bulb.toggle()
bulbTemperature = bulb.surfaceTemperatureForAmbientTemperature(ambientTemperature)
print("the bulb's temperature when \(bulb) is \(bulbTemperature)")
