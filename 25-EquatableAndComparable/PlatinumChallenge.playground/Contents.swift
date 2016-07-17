//: Playground - noun: a place where people can play

import Cocoa


struct Point {
    let x: Int
    let y: Int
}

extension Point: Comparable { }
// == if same distance from origin
func ==(lhs: Point, rhs: Point) -> Bool {
    return distanceFromOrigin(lhs) == distanceFromOrigin(rhs)
}

// lhs < rhs if has lesser distance from origin
func <(lhs: Point, rhs: Point) -> Bool {
    return distanceFromOrigin(lhs) < distanceFromOrigin(rhs)
}

/* Bronze Challenge */
func +(lhs: Point, rhs: Point) -> Point {
    return Point(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
}

private func euclideanDistance(p1: Point, p2: Point) -> Double {
    let deltaX = Double(p1.x - p2.x)
    let deltaY = Double(p1.y - p2.y)
    return sqrt(pow(deltaX, 2) + pow(deltaY, 2))
}

private func distanceFromOrigin(point: Point) -> Double {
    let origin = Point(x: 0, y: 0)
    return euclideanDistance(point, p2: origin)
}


let a = Point(x: 3, y: 4)
let b = Point(x: 3, y: 4)

let abEquals = (a == b)
let abNotEquals = (a != b)  // != implemented for free

// Comparable: only need to implement == and <. <=, >=, >, and != generated for you.
// Can remove Equatable from struct declaration, since Comparable inherits from Equatable
let c = Point(x: 3, y: 4)
let d = Point(x: 2, y: 5)

let cdEqual = (c == d)
let cLessThanD = (c < d)
let cLessThanEqualD = (c <= d)
let cGreaterThanD = (c > d)
let cGreaterThanEqualD = (c >= d)

let cDistOrigin = distanceFromOrigin(c)
let cDistD = euclideanDistance(c, p2: d)


let p1 = Point(x: 3, y: 4)
let p2 = Point(x: -3, y: -4)

let p1EqualP2 = (p1 == p2)
