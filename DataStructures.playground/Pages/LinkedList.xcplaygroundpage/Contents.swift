// Linked List
import UIKit

var greeting = "Hello, playground"


// The benefits of Linked list are constant time insertions and removals from the front of the list and reliable performance characteristics

// Nodes in linked list have 2 purposes hold a value and hold a reference to the next value

// There are 3 main ways to add values to a linked list and they are as follows
//  1 push   adds a value at the front of the list   O(1)
//  2 append     adds value at end obviously         O(1)
//  3 insert(after:)   adds value after a particular node in the list     O(1)

//There are also 3 main ways to remove items from a linked list.

// pop   - (remove at head) removes the value at the front of the list   O(1)
// removeLast  - removes Value at the end of the list  O(n) (remove at Tail)
// remove(at:) - removes value anywhere in the list
// insert(at:) - this is O(1) but requires you to have a reference to a particular node before hand
// remove(after:) - remove the immediate next node



example(of: "creating and linking nodes the most simple and basic way, have to add values manually literally") {
  let node1 = Node(value: 1)
  let node2 = Node(value: 2)
  let node3 = Node(value: 3)
  
  node1.next = node2
  node2.next = node3
  
  print(node1)
}


example(of: "push an item to the front of the linked list") {
  var list = LinkedList<Int>()
  list.push(3)
  list.push(2)
  list.push(1)
  print(list)
}

example(of: "append or tail end insertion") {
  var list = LinkedList<Int>()
  list.append(1)
  list.append(2)
  list.append(3)
  
  print(list)
}


example(of: "inserting at a particular index") {
  var list = LinkedList<Int>()
  list.push(3)
  list.push(2)
  list.push(1)
  
  print("Before inserting: \(list)")
  var middleNode = list.node(at: 1)!
  for _ in 1...4 {
    middleNode = list.insert(-1, after: middleNode)
  }
  print("After inserting: \(list)")
}

example(of: "pop -  remove from the front of the list") {
  var list = LinkedList<Int>()
  list.push(3)
  list.push(2)
  list.push(1)
  
  print("Before popping list: \(list)")
  let poppedValue = list.pop()
  print("After popping list: \(list)")
  print("Popped value: " + String(describing: poppedValue))
}

example(of: "removing the last node") {
  var list = LinkedList<Int>()
  list.push(3)
  list.push(2)
  list.push(1)

  print("Before removing last node: \(list)")
  let removedValue = list.removeLast()

  print("After removing last node: \(list)")
  print("Removed value: " + String(describing: removedValue))
}

example(of: "removing the last node this is an O(n) operation because you have to traverse all the way down the list") {
  var list = LinkedList<Int>()
  list.push(3)
  list.push(2)
  list.push(1)

  print("Before removing last node: \(list)")
  let removedValue = list.removeLast()

  print("After removing last node: \(list)")
  print("Removed value: " + String(describing: removedValue))
}


example(of: "removing a node after a particular node") {
  var list = LinkedList<Int>()
  list.push(3)
  list.push(2)
  list.push(1)
  
  print("Before removing at particular index: \(list)")
  let index = 1
  let node = list.node(at: index - 1)!
  let removedValue = list.remove(after: node)
  
  print("After removing at index \(index): \(list)")
  print("Removed value: " + String(describing: removedValue))
}


//__________________________________________________
    // There are 2 protocols that make a linked list more swifty - and that is sequence and the collection protocol.

//Becoming a Swift collection
//In this section, you’ll look into implementing the Collection protocol. A collection type is a finite sequence and provides nondestructive sequential access. A Swift Collection also allows for access via a subscript, which is a fancy term for saying an index can be mapped to a value in the collection.

//A collection type itself requires that indexing, be of an O(1) operation, since an  linked list he linked list cannot achieve O(1) subscript operations using integer indexes. Thus, your goal is to define a custom index that contains a reference to its respective node.

example(of: "using collection") {
  var list = LinkedList<Int>()
  for i in 0...9 {
    list.append(i)
  }
  
  print("List: \(list)")
  print("First element: \(list[list.startIndex])")
  print("Array containing first 3 elements: \(Array(list.prefix(3)))")
  print("Array containing last 3 elements: \(Array(list.suffix(3)))")
  
  let sum = list.reduce(0, +)
  print("Sum of all values: \(sum)")
}

example(of: "array cow") {
  let array1 = [1, 2]
  var array2 = array1
  
  print("array1: \(array1)")
  print("array2: \(array2)")
  
  print("---After adding 3 to array 2: Just General Value Semanticw---")
  array2.append(3)
  print("array1: \(array1)")
  print("array2: \(array2)")
}

// The answer is no, linked list have reference semantics, implementing COW will fix the value semantics problem that linked lists face.
example(of: "Does link list have value semantics??? linked list cow") {
  var list1 = LinkedList<Int>()
  list1.append(1)
  list1.append(2)
 // var list2 = list1
    
    print("List1 uniquely referenced: \(isKnownUniquelyReferenced(&list1.head))")
    var list2 = list1
    print("List1 uniquely referenced: \(isKnownUniquelyReferenced(&list1.head))")
    
  print("List1: \(list1)")
  print("List2: \(list2)")
  
  print("After appending 3 to list2")
  list2.append(3)
  print("List1: \(list1)")
  print("List2: \(list2)")
    
    print("Removing middle node on list2")
    if let node = list2.node(at: 0) {
      list2.remove(after: node)
    }
    print("List2: \(list2)")
}

//
//The strategy to achieve value semantics with COW is fairly straightforward. Before mutating the contents of the linked list, you want to perform a copy of the underlying storage and update all references (head and tail) to the new copy.
// https://www.raywenderlich.com/books/data-structures-algorithms-in-swift/v3.0/chapters/6-linked-list


// LinkedList uses a class which is reference bases so in order to imp[lement COW or (copy on write) we have to make a copy and update the head and the tail.

//Key points
//Linked lists are linear and unidirectional. As soon as you move a reference from one node to another, you can’t go back.
//Linked lists have a O(1) time complexity for head first insertions. Arrays have O(n) time complexity for head-first insertions.
//Conforming to Swift collection protocols such as Sequence and Collection offers a host of helpful methods for a fairly small amount of requirements.
//Copy-on-write behavior lets you achieve value semantics.

var list1 = LinkedList<Int>()
(1...3).forEach { list1.append($0) }
var list2 = list1

list2.push(0)

print("List1 \(list1)")  // List1 1 -> 2 -> 3  proves that COW is working, head first insertions can avoid the cow tax
print("List2 \(list2)")  // List2 0 -> 1 -> 2 -> 3
