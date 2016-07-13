import Cocoa
import Swift

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
    
    /* Bronze Challenge */
    func filter(f: Element -> Bool) -> Stack<Element> {
        var filteredItems = [Element]()
        for item in items {
            if (f(item)) {
                filteredItems.append(item)
            }
        }
        return Stack<Element>(items: filteredItems)
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

print("Bronze Challenge: filter()")
var myStack = Stack<Int>(items: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
var oddNumbersStack = myStack.filter({
    $0 % 2 == 1
})

for num in oddNumbersStack {
    print(num)
}

/* Silver Challenge */
func findAll<T: Equatable>(items: [T], _ query: T) -> [Int] {
    var equalIndices = [Int]()

    for (i, _) in items.enumerate() {
        if items[i] == query {
            equalIndices.append(i)
        }
    }
    return equalIndices
}

print("Silver Challenge: findAll()")
let searchArray = [5, 3, 7, 3, 9, 3]
let matchIndices: [Int] = findAll(searchArray, 3)
for match in matchIndices {
    print(match)
}
// => 1, 3, 5

let stringSearchArray = ["a", "abc", "zzz", "xyz", "a", "b"]
let stringMatchIndices = findAll(stringSearchArray, "a")
for match in stringMatchIndices {
    print(match)
}
// => 0, 4

/* Gold Challenge */
func findAllInCollection<Element: Equatable, C: CollectionType where C.Generator.Element == Element>
        (collection: C, _ query: Element) -> [C.Index] {
    return collection.indices.filter({ collection[$0] == query })
}

print("Gold Challenge: findAllInCollection()")
let searchCollection: [Int] = [5, 3, 7, 3, 9, 3]
let matching: [Int] = findAllInCollection(searchCollection, 3)
for match in matching {
    print(match)
}
