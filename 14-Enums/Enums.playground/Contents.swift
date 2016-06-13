// Enumerations

import UIKit

/* Basic Enums */

// Enum values are types, so they are in UpperCamelCase, not ALL_CAPS
enum TextAlignment {
    case Left
    case Right
    case Center
    case Justify
}

// Because enum declares a new type, you can now create instances of that type
//var alignment: TextAlignment = TextAlignment.Left 
// Type is inferrable
var alignment = TextAlignment.Left

// If variable already known to be of some enum type, can leave out the enum name when assigning new value
alignment = .Right

// Can also omit the enum type when passing its values to functions or comparing them
if alignment == .Right {
    print("we should right-align the text!")
}

// usually use switch, not if
switch alignment {
case .Left:
    print("left aligned")

case .Right:
    print("right aligned")
    
case .Center:
    print("center aligned")
    
case .Justify:
    print("justified")
}


