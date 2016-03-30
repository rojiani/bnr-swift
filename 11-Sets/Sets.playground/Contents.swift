//: Playground - noun: a place where people can play

import UIKit

var groceryBag = Set<String>()

groceryBag.insert("Apple")
groceryBag.insert("Banana")
groceryBag.insert("Mango")

for food in groceryBag {
    print(food)
}

var audioBrands = Set(["Onkyo", "Bose", "Harmon/Karndon", "Denon", "Bose"]) // Takes Array instance
print(audioBrands)
for brand in audioBrands {
    print(brand)
}

// .union()

// .intersect()

// disjoint - .isDisjointWith()

let yourFirstBag = Set(["Grapes", "Yogurt"])
let yourSecondBag = Set(["Grapes", "Honey"])
let disjoint = yourFirstBag.isDisjointWith(yourSecondBag)

/* Bronze Challenge */
let myCities = Set(["Atlanta", "Chicago", "Jacksonville", "New York", "San Francisco"])
let yourCities = Set(["Chicago", "San Francisco", "Jacksonville"])
// myCities contains all cities in yourCities?
myCities.isStrictSupersetOf(yourCities)
yourCities.isStrictSubsetOf(myCities)
myCities.isStrictSubsetOf(yourCities)

