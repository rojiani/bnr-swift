import Cocoa

struct Stack<Element>: SequenceType {
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
    
    // MARK: SequenceType Protocol Conformance
    func generate() -> StackGenerator<Element> {
        return StackGenerator(stack: self)
    }
}

struct StackGenerator<T>: GeneratorType {
    var stack: Stack<T>
    
    mutating func next() -> T? {
        return stack.pop()
    }
}

func pushItemsOntoStack<Element, S: SequenceType where S.Generator.Element == Element>
        (inout stack: Stack<Element>, fromSequence sequence: S) {
    for item in sequence {
        stack.push(item)
    }
}

var myStack = Stack<Int>()
myStack.push(10)
myStack.push(20)
myStack.push(30)

var myStackGenerator = StackGenerator(stack: myStack)
while let value = myStackGenerator.next() {
    print("got \(value)")
}

for value in myStack {
    print("for-in loop: got \(value)")
}

pushItemsOntoStack(&myStack, fromSequence: [1, 2, 3])
for value in myStack {
    print("after pushing from sequence: got \(value)")
}

var myOtherStack = Stack<Int>()
pushItemsOntoStack(&myOtherStack, fromSequence: [1, 2, 3])
pushItemsOntoStack(&myStack, fromSequence: myOtherStack)
for value in myStack {
    print("after pushing items onto stack: got \(value)")
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
