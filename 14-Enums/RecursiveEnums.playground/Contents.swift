// Recursive Enums - p. 247

import UIKit


// Can you attach an associated value of an enum's own type to one of its cases?

indirect enum FamilyTree {
    case NoKnownParents
    case OneKnownParent(name: String, ancestors: FamilyTree)
    case TwoKnownParents(fatherName: String, fatherAncestors: FamilyTree,
                         motherName: String, motherAncestors: FamilyTree)
}

// or
// enum FamilyTree {
//    case NoKnownParents
//    indirect case OneKnownParent(name: String, ancestors: FamilyTree)
//    indirect case TwoKnownParents(fatherName: String, fatherAncestors: FamilyTree,
//        motherName: String, motherAncestors: FamilyTree)
//}
// indirect keyword for enums w/ good example: see https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Enumerations.html

let fredAncestors = FamilyTree.TwoKnownParents(fatherName: "Fred Sr.",
                                               fatherAncestors: .OneKnownParent(name: "Beth", ancestors: .NoKnownParents),
                                               motherName: "Marsha",
                                               motherAncestors: .NoKnownParents)
