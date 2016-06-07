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
// let volunteersSorted = volunteerCounts.sort() { $0 < $1 }  // sort()
// let volunteersSorted = volunteerCounts.sort { $0 < $1 }    // sort (also OK if only 1 parameter)


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

/* map(_:) */
print()
print(13.16, "(map)")
let precinctPopulations = [1244, 2021, 2157]
let projectPopulations = precinctPopulations.map {
    (population: Int) -> Int in
    return population * 2
}

/* filter(_:) */
let nums = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
let oddNums = nums.filter { $0 % 2 == 1 }  // 'trailing closure syntax'. 
// nums.filter({ $0 % 2 == 1 }) also ok
// nums.filter { $0 % 2 == 1 } also ok
print("oddNums:", oddNums)

print()
print(13.17, "(filter)")
let bigProjections = projectPopulations.filter({
    (projection: Int) -> Bool in
    return projection > 4000
    // projection > 4000 also ok
})
let bigProjectionsSimpler = projectPopulations.filter( { $0 > 4000 } )
print("bigProjections:", bigProjections)
print("bigProjectionsSimpler:", bigProjectionsSimpler)

/* reduce(_:combine:) */
// https://en.wikipedia.org/wiki/Fold_(higher-order_function)
// fold, also known variously as reduce, accumulate, aggregate, compress, or inject
print()
print(13.18, "reduce(_:combine:)")
let totalProjection = projectPopulations.reduce(0, combine: {
    (accumulatedProjection: Int, precinctProjection: Int) -> Int in
    return accumulatedProjection + precinctProjection
})
print("totalProjection:", totalProjection)

/* Gold Challenge */
// using + as an operator function:
let totalProjectionGold1 = projectPopulations.reduce(0, combine: { $0 + $1 })
// let totalProjectionGold1 = projectPopulations.reduce(0) { $0 + $1 }    // with trailing closure syntax
print(totalProjectionGold1)

let totalProjectionGold2 = projectPopulations.reduce(0, combine:+)
print(totalProjectionGold2)
