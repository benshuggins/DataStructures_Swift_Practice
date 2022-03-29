// Stacks :

//https://www.raywenderlich.com/books/data-structures-algorithms-in-swift/v3.0/chapters/4-stack-data-structure

// Push and Pop both have O(1) time complexities

// THE Point of stacks are to limit the number of ways to access your data, adding Collection protocol conformance which would expose all elemenst via Iterators and indexes

// Stacks are crucial to how graphs and trees work so good to know them first.

// Imagine trying to navigate through a maze, each time you come to a decision sucha s left, right , or straight you add theses choices to your stack. In this way you can keep track of your decisions and backtracking is much easier

//Key points
//A stack is a LIFO, last-in first-out, data structure.
//Despite being so simple, the stack is a key data structure for many problems.
//The only two essential operations for the stack are the push method for adding elements and the pop method for removing elements.

import Foundation

var greeting = "Hello, playground"


example(of: "using a stack simple implemention without the ability to create from arrays or array literals") {
  var stack = Stack<Int>()
  stack.push(1)
  stack.push(2)
  stack.push(3)
  stack.push(4)

  print(stack)

  if let poppedElement = stack.pop() {
    assert(4 == poppedElement)
    print("Popped: \(poppedElement)")
  }
    print(stack)
}

// This initializes a stack from an array but not for an array literal
example(of: "initializing a stack from an array NOT an array literal") {
  let array = ["A", "B", "C", "D"]
  var stack = Stack(array)
  print(stack)
  stack.pop()
}

example(of: "initializing a stack from an array literal, must also add Exprssible buy array Literal Protocol") {
  var stack: Stack = [1.0, 2.0, 3.0, 4.0]
  print(stack)
  stack.pop()
 print(stack)
}


