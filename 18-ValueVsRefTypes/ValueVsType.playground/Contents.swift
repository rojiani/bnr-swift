//: Playground - noun: a place where people can play

import UIKit


/* Value Types */
var str = "Hello, playground"
var playgroundGreeting = str

playgroundGreeting += "! How are you today?"

print(playgroundGreeting)
print(str)

// "value semantics" -  ⌥ + click on String to see doc
/* “Value types are always copied when they are assigned to an instance or passed as an argument to a function." */

/* YOU SHOULD ALWAYS CONSIDER MODELING YOUR DATA WITH A STRUCT FIRST, & THEN MOVE ON TO USING A CLASS IF NEEDED. */

/* Reference Types */
// Reference semantics: AN ADDITIONAL REFERENCE TO THE SAME UNDERLYING INSTANCE IS CREATED for assignment or passing to function (i.e., assigning to param variable in local frame)

class GreekGod {
    var name: String
    init(name: String) {
        self.name = name
    }
}

let hecate = GreekGod(name: "Hecate")
let anotherHecate = hecate

// hecate ---------------> Memory addr 0x04928FAF9
// anotherHecate --------> Memory addr 0x04928FAF9
