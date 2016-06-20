// Ch. 15 For the More Curious - Function Currying

import Cocoa

/* Function currying allows you to rewrite an existing function that takes mult. parameters
   as a new function that takes one parameter and returns another function. 
   The function you return takes the original function's remaining parameters and returns 
   what the original function returns. 
   This process of nesting functions, each with the remaining number of parameters, continues
   until there are no remaining parameters. 
 
 
   The rewritten function is called a 'curried function'. A curried function partially applies
   an existing function. That is, a curried function allows you to bind values to a function's
   arguments before you call it. This feature is similar to supplying default values to a 
   function's parameters, but is far more dynamic. */

// Simple function
func greetName(name: String, withGreeting greeting: String) -> String {
    return "\(greeting) \(name)"
}

let personalGreeting = greetName("Navid", withGreeting: "Hello,")
print(personalGreeting)

// Curried greetName
func greetingForName(name: String) -> (String) -> String {
    func greeting(greeting: String) -> String {
        return "\(greeting) \(name)"
    }
    return greeting
}

let greeterFunction = greetingForName("Navid")
let theGreeting = greeterFunction("What's up")
print(theGreeting)

// A more concise curried function
func greeting(greeting: String)(name: String) -> String {
    return "\(greeting) \(name)"
}

// Curried function declaration syntax will be removed in a future version of Swift
// use single parameter list
