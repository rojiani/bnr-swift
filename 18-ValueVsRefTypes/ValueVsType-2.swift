

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
    var chiefGod: GreekGod
}

let pantheon = Pantheon(chiefGod: hecate)
// let struct -> can't change property or instance
// pantheon = Pantheon(chiefGod: anotherHecate) // ERROR

let zeus = GreekGod(name: "Zeus")
// pantheon.chiefGod = zeus     // ERROR
zeus.name = "Zeus Jr."          // is OK - let class only means you can't change the *instance* it points to
print(zeus.name)                // 'zeus' is still a reference to a GreekGod


// Value Type with a Reference Type inside
// MUST BE VERY CAREFUL!
print(pantheon.chiefGod.name)       // => AnotherHecate
let greekPantheon = pantheon        // copy of pantheon, which contains ptr to hecate
hecate.name = "Trivia"              // changes instance pointed to by both hecate and anotherHecate
print(pantheon.chiefGod.name)       // => Trivia
print(greekPantheon.chiefGod.name)  // => Trivia

// chiefGod is a pointer to the GreekGod.
// let greekPantheon = pantheon copies the pointer (address)
// hecate.name = "Trivia" changes the GreekGod pointed to by anotherHecate and hecate

/*
“You should expect instances of value types to be copied when assigned to a new
variable or constant or passed into a function. Somewhat confusingly, however,
a value type with a reference type in a property will pass along that same
reference to the new variable or constant. That reference will still point to
the same instance as the original reference, and changes to any of them will be
reflected in all of them. ”
*/


