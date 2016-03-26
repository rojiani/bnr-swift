//: Playground - noun: a place where people can play

import UIKit

/* Swift switch statements do not act the same as switch statements in C/Objective-C (see p. 87) */

/* Switch cases can have multiple values */
print(5.2)
var statusCode = 404
var errorString = "The request failed with the error:"

switch statusCode {
    case 400, 401, 403, 404:
        errorString = "There was something wrong with the request."
        fallthrough
    default:
        errorString += " Please review the request and try again."
}

print(errorString)

/* Cases can have ranges */
print(5.3)
statusCode = 404
errorString = "The request failed with the error:"

switch statusCode {
case 100, 101:
    errorString += " Informational, 1xx."
    
case 204:
    errorString += " Successful but no content, 204."
    
case 300...307:
    errorString += " Redirection, 3xx."
    
case 400...417:
    errorString += " Client error, 4xx."
    
case 500...505:
    errorString += " Server error, 5xx."
    
default:
    errorString += " Unkown. Please review the request and try again."
}

print(errorString)

/* Value binding */
print(5.4)
statusCode = 999
errorString = "The request failed with the error:"
switch statusCode {
case 100, 101:
    errorString += " Informational, \(statusCode)."
    
case 204:
    errorString += " Successful but no content, \(statusCode)."
    
case 300...307:
    errorString += " Redirection, \(statusCode)."
    
case 400...417:
    errorString += " Client error, \(statusCode)."
    
case 500...505:
    errorString += " Server error, \(statusCode)."
    
case let unknownCode:
    errorString = "\(unknownCode) is not a known error code."

// could use this instead of last case to get same result.
// default:
//     errorString = "\(statusCode) is not a known error code."
}

print(errorString)

print(5.5)
statusCode = 204
errorString = "The request failed with the error:"
switch statusCode {
case 100, 101:
    errorString += " Informational, \(statusCode)."
    
case 204:
    errorString += " Successful but no content, \(statusCode)."
    
case 300...307:
    errorString += " Redirection, \(statusCode)."
    
case 400...417:
    errorString += " Client error, \(statusCode)."
    
case 500...505:
    errorString += " Server error, \(statusCode)."
    
case let unknownCode:
    errorString = "\(unknownCode) is not a known error code."
    
    // could use this instead of last case to get same result.
    // default:
    //     errorString = "\(statusCode) is not a known error code."
}

print(errorString)

/* Tuples */
//let error = (statusCode, errorString)
//error.0
//error.1
let error = (code: statusCode, error: errorString)
error.code
error.error

print(5.10)
let firstErrorCode = 404
let secondErrorCode = 200
let errorCodes = (firstErrorCode, secondErrorCode)

// _ is a wildcard, will match anything
switch errorCodes {
case (404, 404):
    print("No items found")
case (404, _):
    print("First item not found.")
case(_, 404):
    print("Second item not found")
default:
    print("All items found")
}

/* if-case */
print(5.11, "if-case")
let age = 25

if case 18...35 = age {
    print("Cool demographic")
}

print(5.12, "if-case with where clauses")
if case 18...35 = age where age >= 21 {
    print("In cool demographic and of drinking age")
}
