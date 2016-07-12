//: Playground - noun: a place where people can play

import Cocoa

struct Stack<Element> {
    var items = [Element]()
    
    mutating func push(newItem: Element) {
        items.append(newItem)
    }
    
    mutating func pop() -> Element? {
        guard !items.isEmpty else {
            return nil
        }
        return items.removeLast()
    }
    
    func map<U>(f: Element -> U) -> Stack<U> {
        var mappedItems = [U]()
        for item in items {
            mappedItems.append(f(item))
        }
        return Stack<U>(items: mappedItems)
    }
}

var intStack = Stack<Int>()
intStack.push(1)
intStack.push(2)
var doubledStack = intStack.map { 2 * $0 }
print(doubledStack)

print(intStack.pop())       // => Optional(2)
print(intStack.pop())       // => Optional(1)
print(intStack.pop())       // => nil

print(doubledStack.pop())   // => Optional(4)
print(doubledStack.pop())   // => Optional(2)

var stringStack = Stack<String>()
stringStack.push("this is a string")
stringStack.push("another string")

print(stringStack.pop())    // => Optional("another string")

func myMap<T, U>(items: [T], f: (T) -> (U)) -> [U] {
    var result = [U]()
    for item in items {
        result.append(f(item))
    }
    return result
}

let strings = ["one", "two", "three"]
let stringLengths = myMap(strings, f: { $0.characters.count })
print(stringLengths)

func checkIfEqual<T: Equatable>(first: T, _ second: T) -> Bool {
    return first == second
}

print(checkIfEqual(1, 1))
print(checkIfEqual(1, 2))
print(checkIfEqual("a string", "a string"))
print(checkIfEqual("a string", "a different string"))


func checkIfDescripitionsMatch<T: CustomStringConvertible, U: CustomStringConvertible>(first: T, _ second: U) -> Bool {
    return first.description == second.description
}

print(checkIfDescripitionsMatch(Int(1), UInt(1)))
print(checkIfDescripitionsMatch(1, 1.0))
print(checkIfDescripitionsMatch(Float(1.0), Double(1.0)))
