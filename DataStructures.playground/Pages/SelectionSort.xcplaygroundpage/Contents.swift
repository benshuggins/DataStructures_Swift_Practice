
//Selection sort
//Selection sort follows the basic idea of bubble sort, but improves upon this algorithm by reducing the number of swapAt operations. Selection sort will only swap at the end of each pass. You’ll see how that works in the following example and implementation.

// selection sort really only cares about finding the lowest value and moving that to the front of the array.

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

// Selection sort is slightly faster than the slowest which is bubble sort, however since big O looks at worst case scenario. Selection sort worse case scenario is O(n^2)

example(of: "selection sort") {
  var array = [9, 4, 10, 3]
  print("Original: \(array)")
  selectionSort(&array)
  print("Selection sorted: \(array)")
}
