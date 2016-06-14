// Bronze & Silver Challenges (p. 249-250)
import UIKit

enum ShapeDimensions {
    
    case Square(sideLength: Double)
    
    case Rectangle(width: Double, height: Double)
    
    case Point()
    
    case RightTriangle(sideA: Double, sideB: Double, hypotenuse: Double)
    
    func area() -> Double {
        switch self {
            // Use Swift's pattern matching to bind self's associated value with a new variable(s)
        // see 'switch' chapter: 'value binding'
        case let .Square(sideLength: side):
            return side * side
            
        case let .Rectangle(width: w, height: h):
            return w * h
            
        case let RightTriangle(sideA: a, sideB: b, hypotenuse: _):
            return (0.5 * a * b)
            
        // case Point also works (. not required?)
        case .Point:
            return 0
        }
    }
    
    /* Bronze Challenge */
    func perimeter() -> Double {
        switch self {
            
        case let .Square(sideLength: side):
            return 4 * side
            
        case let .Rectangle(width: w, height: h):
            return (2 * w) + (2 * h)
            
        case let .RightTriangle(sideA: a, sideB: b, hypotenuse: c):
            return a + b + c
            
        case .Point:
            return 0
            
        }
    }
}

var squareShape = ShapeDimensions.Square(sideLength:10.0)
var rectShape = ShapeDimensions.Rectangle(width: 5.0, height: 10.0)
var pointShape = ShapeDimensions.Point()

print("square's perimeter = \(squareShape.perimeter())")
print("rectangle's perimeter = \(rectShape.perimeter())")
print("point's perimeter = \(pointShape.perimeter())")

/* Silver Challenge */
var rightTriangleShape = ShapeDimensions.RightTriangle(sideA: 3, sideB: 4, hypotenuse: 5)
print("right triangle's area = \(rightTriangleShape.area())")
print("right triangle's perimeter = \(rightTriangleShape.perimeter())")
