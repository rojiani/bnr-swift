//: Playground - noun: a place where people can play

import Cocoa


struct Point: Comparable {
    let x: Int
    let y: Int
}

/* Gold Challenge */
class Person {
    let name: String
    var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }

    convenience init() {
        self.init(name: "John Doe", age: 25)
    }
}


// == and other infix operators must be defined at global scope.
func ==(lhs: Point, rhs: Point) -> Bool {
    return (lhs.x == rhs.x) && (lhs.y == rhs.y)
}

func <(lhs: Point, rhs: Point) -> Bool {
    return (lhs.x < rhs.x) && (lhs.y < rhs.y)
}

/* Bronze Challenge */
func +(lhs: Point, rhs: Point) -> Point {
    return Point(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
}

// Error "invalid redeclaration of '=='
extension Person: Equatable { }
func ==(lhs: Person, rhs: Person) -> Bool {
    return (lhs.name == rhs.name) && (lhs.age == rhs.age)
}


let a = Point(x: 3, y: 4)
let b = Point(x: 3, y: 4)

let abEquals = (a == b)
let abNotEquals = (a != b)  // != implemented for free

// Comparable: only need to implement == and <. <=, >=, >, and != generated for you.
// Can remove Equatable from struct declaration, since Comparable inherits from Equatable
let c = Point(x: 2, y: 6)
let d = Point(x: 3, y: 7)

let cdEqual = (c == d)
let cLessThanD = (c < d)
let cLessThanEqualD = (c <= d)
let cGreaterThanD = (c > d)
let cGreaterThanEqualD = (c >= d)

/* Bronze Challenge */
let aPlusB = a + b
print(aPlusB)

let bPlusD = b + d
print(bPlusD)

/* Gold Challenge */

let p1 = Person(name: "Navid Rojiani", age: 29)
let p2 = Person(name: "Emily Hill", age: 26)
var people = [Person]()
people.append(p1)
people.append(p2)

let p1Index = people.indexOf { $0 == p1 }
print(p1Index)
