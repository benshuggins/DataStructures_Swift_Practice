//Stacks Challenge #2

import Foundation

var greeting = "Hello, playground"

//Challenge 2: Balance the parentheses
//Check for balanced parentheses. Given a string, check if there are ( and ) characters, and return true if the parentheses in the string are balanced. For example:
//// 1
//h((e))llo(world)() // balanced parentheses
//
//// 2
//(hello world // unbalanced parentheses
//

//________MY THOUGHTS_________________________________________________

// NEED TO CHECK FOR SYMMETRY, I can only push and pop off the top

// First thing to note is that ( has to come first, so if we start with ) and the stack is already empty then we know we aren't symmetrical.
// Else remove whats next because we dont care

// we want to keep the stack balanced by keeping it as empty as possible


//_________
                        // HOW IT REALLY WORKS
// _______________________Ok this is really how stacks work, and how this problem works we are iterating through the array and if we see (, we add it to the top or our stack, if we see another we add it to. If we see a ), then we remove the last ( so that it stays balanced. As long as when we get to the end and our stack is empty then we know that our string has a symmetrical amount of ()!!!


var testString1 = "h((e))llo(world()"

// your code here

func checkParentheses(_ string: String)->Bool{
    
    var counter = 0
    var stack = Stack<Character>()
    
    for character in string {
       
        if character == "(" {
            stack.push(character)
            print("ADDED: \(character)")
            print(stack)
        } else if character == ")" {
            if stack.isEmpty {
                return false
            } else {
                stack.pop()
            }
        }
    }
    return stack.isEmpty  // return true if the stack stay empty until the end.
}

 checkParentheses(testString1) // should be true

