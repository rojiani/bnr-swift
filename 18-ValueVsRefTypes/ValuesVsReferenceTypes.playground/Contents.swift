//: Playground - noun: a place where people can play

import UIKit


class GreekGod {
    var name: String
    init(name: String) {
        self.name = name
    }
}

let hecate = GreekGod(name: "Hecate")
let anotherHecate = hecate

anotherHecate.name = "AnotherHecate"  // changes underlying object pointed to by both
print(anotherHecate.name)              // => AnotherHecate
print(hecate.name)                     // => AnotherHecate


// Value type
struct Pantheon {
    // var chiefGod: GreekGod
    let chiefGod: GreekGod
    let dateCreated = NSDate()      // immutable Reference type
}

let pantheon = Pantheon(chiefGod: hecate)
let greekPantheon = pantheon
print(greekPantheon.chiefGod.name)
print(greekPantheon.dateCreated)

let athena = GreekGod(name: "Athena")
