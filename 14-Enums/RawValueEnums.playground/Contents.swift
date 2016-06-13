// Raw Value (C-like) Enums, p. 234

import UIKit


// "raw value" enum, like in C. Case values equal 0, 1, 2...
enum TextAlignment: Int {
    case Left
    case Right
    case Center
    case Justify
}

/* 14.12 - Confirming the raw values */

var alignment = TextAlignment.Justify

print("Left has raw value \(TextAlignment.Left.rawValue)")
print("Justify has raw value \(TextAlignment.Justify.rawValue)")
print("The alignment variable has raw value \(alignment.rawValue)")


/* 14.13 - Specifying raw values */
enum TextAlignmentSpecified: Int {
    case Left    = 20
    case Right   = 30
    case Center  = 40
    case Justify = 50
}

// When used? See p. 234
// Usually to store or transmit the enum
// Convert raw value -> enum type?
// Every enum with a raw value can be created with a 'rawValue:' argument, which returns an optional enum

/* 14.14 - Converting raw values to enum types */

// Create a raw value.
let myRawValue = 20

// Try to convert the raw value into a TextAlignment
if let myAlignment = TextAlignmentSpecified(rawValue: myRawValue) {
    // Conversion succeeded!
    print("successfully converted \(myRawValue) into a TextAlignmentSpecified")
} else {
    // Conversion failed.
    print("\(myRawValue) has no corresponding TextAlignmentSpecified case")
}

// Note: if change TextAlignmentSpecified to TextAlignment, conversion will fail, unless myRawValue is changed to 0-3


/* Raw Value type doesn't have to be Int - can be String or variety of other types */

//enum ProgrammingLanguage: String {
//    case Swift      = "Swift"
//    case ObjectiveC = "Objective-C"
//    case C          = "C"
//    case Cpp        = "C++"
//    case Java       = "Java"
//}
//
//let myFavoriteLanguage = ProgrammingLanguage.Swift
//print("My favorite programming language is \(myFavoriteLanguage.rawValue)")
// print("My favorite programming language is \(myFavoriteLanguage)") ==> same output

enum ProgrammingLanguage: String {
    case Swift
    case ObjectiveC = "Objective-C"
    case C
    case Cpp        = "C++"
    case Java
}

let myFavoriteLanguage = ProgrammingLanguage.Swift
print("My favorite programming language is \(myFavoriteLanguage.rawValue)")
// print("My favorite programming language is \(myFavoriteLanguage)") ==> same output

