//Stacks Challenges

import Foundation

var greeting = "Hello, playground"

//CHALLENGE STACKS #1. Reserve an Array
//
//Create a function that prints the contents of an array in reversed order.

//______________________________________This is reversing an array using a stack
var array: [Int] = [1, 2, 3, 4, 5]

// Your code here

func printInReversed<T>(_ array: [T]) {
    
    var stack = Stack<T>()
    
    for value in array {
        print(value)
        stack.push(value)
        //print(stack)
    }
    print(stack)
    
    while let value = stack.pop() {
        print(value)
    }
    
}
printInReversed(array)
