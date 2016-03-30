//: Playground - noun: a place where people can play

import UIKit

/* Syntax */
var dict1: Dictionary<String, Double> = [:]
var dict2 = Dictionary<String, Double>()
var dict3: [String:Double] = [:]
var dict4 = [String:Double]()

print(10.1-10.2)
var movieRatings = ["Donnie Darko": 4, "Chungking Express": 5, "Dark City": 4]
print(movieRatings.count)
let darkoRating = movieRatings["Donnie Darko"]    // Int? (4)
let braveheartRating = movieRatings["Braveheart"] // Int? (nil)

/* Modifying Values */
movieRatings["Dark City"] = 5
print(movieRatings)
// or
//movieRatings.updateValue(3, forKey: "Chungking Express")    // ==> 5 Returns the value that was replaced, or nil if a new key-value 
                                                              // pair was added.
let oldRating: Int? = movieRatings.updateValue(5, forKey: "Donnie Darko")
if let lastRating = oldRating, currentRating = movieRatings["Donnie Darko"] {
    print("Old rating: \(lastRating); current rating: \(currentRating)")
}

/* Removing values */
let removedRating: Int? = movieRatings.removeValueForKey("Chungking Express")

/* Looping */
print(10.9)
for (key, value) in movieRatings {
    print("The movie \(key) was rated \(value).")
}

print(10.10)
for movie in movieRatings.keys {
    print("User has rated \(movie)")
}

/* Translating a Dictionary to an Array */
print(10.12)
movieRatings.removeAll()
movieRatings["8 1/2"] = 5
movieRatings["Wet Hot American Summer"] = 3
movieRatings["Star Wars Episode 7"] = 3
movieRatings["Room"] = 4
movieRatings["Spectacle"] = 5
print(movieRatings)
let watchedMovies = Array(movieRatings.keys)

/* Silver Challenge */
var washingtonCounties: [String:[Int]] = [:]
washingtonCounties["CountyA"] = [30306, 30307, 30308, 30309, 30310]
washingtonCounties["CountyB"] = [30311, 30312, 30313, 30314, 30315]
washingtonCounties["CountyC"] = [30316, 30317, 30318, 30319, 30320]

var allZips: [Int] = []
for zips in washingtonCounties.values {
    for zip in zips {
        allZips.append(zip)
    }
}
print("Washington has the following zip codes:", allZips)
