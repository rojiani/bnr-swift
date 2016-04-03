//: Playground - noun: a place where people can play

import UIKit


/* number = external parameter name, n = internal parameter name */
func factorial(number n: Int) -> Int {
    if n <= 2 {
        return n
    }
    return n * factorial(number: n - 1)
}

print(factorial(number: 7))


/* Default parameters */
func divisionDescription(forNumerator num: Double,
                         andDenominator den: Double,
                         withPunctuation punctuation: String = ".") {
    
    print("\(num) divided by \(den) equals \(num / den)\(punctuation)")
}

divisionDescription(forNumerator: 9.0, andDenominator: 3.0)
divisionDescription(forNumerator: 9.0, andDenominator: 3.0, withPunctuation: "!")

/* inout */

/* Nested functions and scope */
func areaOfTriangle(withBase base: Double, andHeight height: Double) -> Double {
    let numerator = base * height
    func divide() -> Double {
        return numerator / 2
    }
    return divide()
}

print(areaOfTriangle(withBase: 4, andHeight: 5))

/* Returning Multiple Values */
func sortEvenOdd(numbers: [Int]) -> (evens: [Int], odds: [Int]) {
    var evens = [Int](), odds = [Int]()
    for n in numbers {
        (n % 2 == 0) ? evens.append(n)
                     : odds.append(n)
    }
    return (evens, odds)
}

let nums = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
let (evens, odds) = sortEvenOdd(nums)
print("Evens: \(evens)")
print("Odds: \(odds)")
let sortedLists = sortEvenOdd(nums)
print("Evens: \(sortedLists.evens)")
print("Odds: \(sortedLists.odds)")

/* Optional Return Types */
print(12.12)
//func grabMiddleName(name: (String, String?, String)) -> String? {
//    return name.1
//}

//let middleName = grabMiddleName(("Navid", nil, "Rojiani"))
//let middleName = grabMiddleName(("Navid", "Kareem", "Rojiani"))
//if let theMiddleName = middleName {
//    print(theMiddleName)
//}

func grabMiddleName(name: (first: String, middle: String?, last: String)) -> String? {
    return name.middle
}

let middleName = grabMiddleName((first: "Navid", middle: nil, last: "Rojiani"))
if let middle = middleName {
    print(middle)
}

/* guard Statements in functions */
// a guard statement is used 
//
//func greetByMiddleName(name: (first: String, middle: String?, last: String)) {
//    guard let middleName = name.middle
//        else {
//            print("Hey there!")
//            return
//    }
//    print("Hey \(middleName)!") // note that middleName stays in scope & can be used here
//}
//greetByMiddleName((first: "Navid", middle: nil, last: "Rojiani"))
//greetByMiddleName((first: "Navid", middle: "Danger", last: "Rojiani"))

/* Bronze Challenge */

func greetByMiddleName(name: (first: String, middle: String?, last: String)) {
    guard let middleName = name.middle where middleName.characters.count < 4
        else {
            print("Hey there!")
            return
    }
    print("Hey \(middleName)!") // note that middleName stays in scope & can be used here
}
greetByMiddleName((first: "Navid", middle: nil, last: "Rojiani"))
greetByMiddleName((first: "Navid", middle: "Bob", last: "Rojiani"))

/* Silver Challenge */
func beanSifter(groceryList: [String]) -> (beans: [String], otherGroceries: [String]) {
    var beans = [String]()
    var otherGroceries = [String]()
    
    for item in groceryList {
        if item.containsString("beans") {
            beans.append(item)
        } else {
            otherGroceries.append(item)
        }
    }
    
    return (beans, otherGroceries)
}

let result = beanSifter(["green beans", "milk", "black beans", "pinto beans", "apples"])
print(result.beans)
print(result.otherGroceries)