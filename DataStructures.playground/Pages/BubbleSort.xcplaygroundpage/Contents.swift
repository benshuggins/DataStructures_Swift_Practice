//Bubble Sort

// There are also different kinds of Collections like BidirectionalCollection and MutableCollection

import Foundation

var greeting = "Hello, playground"


example(of: "bubble sort") {
  var array = [9, 4, 10, 3]
  print("Original: \(array)")
  bubbleSort(&array)
  print("Bubble sorted: \(array)")
}
