//: Playground - noun: a place where people can play

import UIKit

var errorCodeString: String?
errorCodeString = "404"
var errorDescription: String?
//if errorCodeString != nil {
//    let theError = errorCodeString!
//    print(theError)
//}

if let theError = errorCodeString, errorInt = Int(theError)
    where errorInt == 404 {
    errorDescription = "\(errorInt + 200): the requested blah blah"
}

var upCaseErrorDescription = errorDescription?.appendContentsOf(" PLEASE TRY AGAIN")
upCaseErrorDescription

// nil coalescing operator

print(8.11)
errorDescription = nil
let description = errorDescription ?? "no error"
print(description)

// Silver Challenge
var x: Double? = Double("39.2")
print(x!)
