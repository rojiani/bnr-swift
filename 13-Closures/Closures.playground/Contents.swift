//: Playground - noun: a place where people can play

import UIKit

var volunteerCounts = [1, 3, 40, 32, 2, 53, 77, 13]

/* Closure syntax
{(parameters) -> return type in
    // Code
}
*/

// print(13.3)
// let volunteersSorted = volunteerCounts.sort({
//     (i: Int, j: Int) -> Bool in
//         return i < j
// })
// print(volunteersSorted)

// print(13.4)
// Taking advantage of type inference
// let volunteersSorted = volunteerCounts.sort({ i, j in i < j })
// print(volunteersSorted)

print(13.5)
//let volunteersSorted = volunteerCounts.sort({ $0 < $1 })
//print(volunteersSorted)

// if closure is the last argument ("trailing closure syntax")
// let volunteersSorted = volunteerCounts.sort { $0 < $1 }

// Using an "operator function":
let volunteersSorted = volunteerCounts.sort(<)
print(volunteersSorted)

/* Functions as Return Types */
func makeTownGrand(budget: Int, condition: Int -> Bool) -> ((Int, Int) -> Int)? {
    if condition(budget) {
        func buildRoads(lightsToAdd: Int, toLights: Int) -> Int {
            return toLights + lightsToAdd
        }
        return buildRoads
    } else {
        return nil
    }
}

func evaluateBudget(budget: Int) -> Bool {
    return budget > 10000
}

var stoplights = 4

if let townPlan = makeTownGrand(100000, condition: evaluateBudget) {
    stoplights = townPlan(4, stoplights)
}
print("Knowhere has \(stoplights) stoplights.")

// Builds a growthTracker() function.
// growth: the integer representing the growth to track
// returns a function that takes no arguments, & returns an Int
// representing the running total of the growth your town is 
// experiencing, totalGrowth
func makeGrowthTracker(forGrowth growth: Int) -> () -> Int {
    var totalGrowth = 0
    func growthTracker() -> (Int) {
        // the value of the totalGrowth variable is captured from
        // enclosing scope
        totalGrowth += growth
        return totalGrowth
    }
    return growthTracker
}

var currentPopulation = 5422
let growBy500 = makeGrowthTracker(forGrowth: 500)
// after growthTracker() is created, the totalGrowth variable will be
// incremented by the amount specified in the argument passed to the
// makeGrowthTracker(forGrowth:) function

// makeGrowthTracker(forGrowth:) called once.
// growBy500() [aka growthTracker] is called multiple times

growBy500()
growBy500()
growBy500()
currentPopulation += growBy500() // currentPopulation is now 7422

/* Closures are Reference Types */
// Closures are references. This means that when you assign a function to 
// a constant or variable, you are actually setting that constant or variable
// to point to the function.
// You are not creating a distinct copy of that function.
// Important consequence: any information captured by the function's scope
// (like totalGrowth, here) will be changed if you call the function via 
// a new constant or variable

let anotherGrowBy500 = growBy500
anotherGrowBy500()
// anotherGrowBy500 and growBy500 point to the same function.

var someOtherPopulation = 4061981
let growBy10000 = makeGrowthTracker(forGrowth: 10000)
someOtherPopulation += growBy10000()
currentPopulation
