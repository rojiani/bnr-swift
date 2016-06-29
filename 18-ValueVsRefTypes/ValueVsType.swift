
/* Value Types */
// String ==> a Struct
print("Struct copying")
var a = "Hello, world"
var b = a

b += "! How are you today?"

print(b)
print(a)

// "value semantics" -  ⌥ + click on String to see doc
// “Value types are always copied when they are assigned to an instance or passed as an argument to a function."

// YOU SHOULD ALWAYS CONSIDER MODELING YOUR DATA WITH A STRUCT FIRST, & THEN MOVE ON TO USING A CLASS IF NEEDED.

/* Reference Types */
// Reference semantics: AN ADDITIONAL REFERENCE TO THE SAME UNDERLYING INSTANCE IS CREATED for assignment or passing to function (i.e., assigning to param variable in local frame)


// class GreekGod {
//     var name: String
//     init(name: String) {
//         self.name = name
//     }
// }
/* class + var property + let instance

print("class + var property + let instance")

let hecate = GreekGod(name: "Hecate")                           // let: hecate must always point to the same GreekGod
let anotherHecate = hecate

// hecate ---------------> Memory addr 0x04928FAF9
// anotherHecate --------> Memory addr 0x04928FAF9

anotherHecate.name = "AnotherHecate"                // Allowed - anotherHecate still points to the same instance of GreekGod
print(anotherHecate.name)   // => AnotherHecate     Both point to same instance in memory, so changing property alters what they both point to
print(hecate.name)          // => AnotherHecate

// hecate = GreekGod(name: "Apollo")        // Can't change instance (error: cannot assign to value: 'hecate' is a 'let' constant)
hecate.name = "Apollo"                      // But can change instance's properties
print(hecate.name)
// print(hecate.name)

*/

/* class + var property + var instance
print()
print("class + var property + var instance")


var hecate = GreekGod(name: "Hecate")
var anotherHecate = hecate

anotherHecate.name = "AnotherHecate"
print(anotherHecate.name)                   // => AnotherHecate
print(hecate.name)                          // => AnotherHecate (changes hecate & anotherHecate, since both point to same obj in memory)

hecate = GreekGod(name: "Apollo")           // can change instance and properties
print(hecate.name)                          // => Apollo
hecate.name = "Zeus"                        // can change the instance's properties
print(hecate.name)

print(anotherHecate.name)                   // Not also changed, since they no longer point to the same instance in memory (since hecate
                                            // now points to the instance with name 'Apollo')
*/

struct GreekGod {
    var name: String
    init(name: String) {
        self.name = name
    }
}

/* Struct + var property + let instance
print("Struct + var property + let instance")

let hecate = GreekGod(name: "Hecate")
let anotherHecate = hecate

// anotherHecate.name = "AnotherHecate"                     // Can't change properties (error: cannot assign to property: 'anotherHecate' is a 'let' constant)
// anotherHecate = GreekGod(name: "Zeus")                   // Can't reassign to new instance (error: cannot assign to value: 'anotherHecate' is a 'let' constant)
*/

/* Struct + var property + var instance */
print("Struct + var property + var instance")

var hecate = GreekGod(name: "Hecate")
var anotherHecate = hecate

anotherHecate.name = "AnotherHecate"                        // This changes only the copy 'anotherHecate'
print(anotherHecate.name)
print(hecate.name)                                          // 'hecate' unaffected

anotherHecate.name = "Zeus"                                 // Can change properties.
print(anotherHecate.name)                                   // => Zeus

hecate = GreekGod(name: "Apollo")                           // Can change instance.
print(hecate.name)                                          // => Apollo