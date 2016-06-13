// Enums: Associated Values - p.241

import UIKit

// Associated values allow you to attach data to instances of an enumeration.
// Different cases can have different types of associated values.

/* 14.24 */
enum ShapeDimensions {
    // Square's associated value is the length of one side
    case Square(sideLength: Double)
    
    // Rectangle's associated value (a tuple) defines its width and height
    case Rectangle(width: Double, height: Double)
    
    // 14.28 - enum cases aren't required to have associated values even if other members do
    case Point()
    
    // 14.26
    func area() -> Double {
        switch self {
        // Use Swift's pattern matching to bind self's associated value with a new variable(s)
        // see 'switch' chapter: 'value binding'
        case let .Square(sideLength: side):
            return side * side
        
        case let .Rectangle(width: w, height: h):
            return w * h
        
        // case Point also works (. not required?)
        case .Point:
            return 0

        }
    }
}

/* 14.25 - Creating shapes */
var squareShape = ShapeDimensions.Square(sideLength: 10.0)
var rectShape = ShapeDimensions.Rectangle(width: 5.0, height: 10.0)
var pointShape = ShapeDimensions.Point()

// You can use a switch statement to unpack an associated value & use it
// see area function in Enum

print("square's area = \(squareShape.area())")
print("rectangle's area = \(rectShape.area())")
print("point's area = \(pointShape.area())")