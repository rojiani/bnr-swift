//: Playground - noun: a place where people can play

import UIKit

/* Initializing */
print("9.1 - 9.3")
// var bucketList: Array<String>
var bucketList: [String] = ["Climb Mt. Everest"]

/* Using Type Inference */
print(9.4)
// var bucketList: ["Climb Mt. Everest"]

/* Accessing & Modifying Arrays */
print(9.5)

bucketList.append("Fly hot air baloon to Fiji")

bucketList.append("Watch the Lord of the Rings trilogy")
bucketList.append("Go on a walkabout")
bucketList.append("Scuba dive in the Great Blue Hole")
bucketList.append("Find a triple rainbow")

func printArray<T>(array: [T]) {
    for (idx, item) in array.enumerate() {
        print("\(idx):  \(item)")
    }
}

printArray(bucketList)
var numsArray: [Int] = [77, 99, 107, -4, 929]
printArray(numsArray)

numsArray.removeAtIndex(2)

//print(bucketList[0...3])


/* Adding with += */
print(9.13)
var bucketList2: [String] = ["Go skydiving"] // must be initialized to use +=
    
var newItems = ["Climb Mt. Everest",
                "Fly hot air baloon to Fiji",
                "Watch the Lord of the Rings trilogy",
                "Go on a walkabout",
                "Scuba dive in the Great Blue Hole",
                "Find a triple rainbow"]

bucketList2 += newItems
printArray(bucketList2)
var subList = bucketList2[0...2]
print(subList.dynamicType) // ArraySlice

print(9.14)
bucketList2.insert("Toboggan across Alaska", atIndex: 2)

/* Array Equality */
// let equal = (bucketList == myronsList) // => true if has same items in same order


/* Bronze Challenge */
var toDoList = ["Take out garbage", "Pay bills", "Cross off finished items"]
toDoList.isEmpty ? print("toDoList is empty") : print("toDoList is not empty")

/* Silver Challenge */
var reversedList: [String] = []
for var i = toDoList.count - 1; i >= 0; --i {
    reversedList.append(toDoList[i])
}
print(reversedList)

// In-Place reverse
print("In Place")
func reverseArray<T>(inout array: [T]) -> [T] {
    var i = 0, j = array.count - 1
    while (i < j) {
        swap(&array[i], &array[j])
        i += 1; j -= 1;
    }
    return array
}

print("Original:", toDoList)
reverseArray(&toDoList)
print("Reversed:", toDoList)
reverseArray(&toDoList)
print("Original:", toDoList)

print("Easy way:")
reversedList = []
for toDo in toDoList.reverse() {
    reversedList.append(toDo)
}
print(reversedList)