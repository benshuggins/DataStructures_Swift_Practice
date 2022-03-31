//Insertion Sort
//https://www.raywenderlich.com/books/data-structures-algorithms-in-swift/v3.0/chapters/26-o-n-sorting-algorithms
// Insertion sort
//Insertion sort is a more useful algorithm. Like bubble sort and selection sort, insertion sort has an average time complexity of O(n²), but the performance of insertion sort can vary. The more the data is already sorted, the less work it needs to do. Insertion sort has a best time complexity of O(n) if the data is already sorted. The Swift standard library sort algorithm uses a hybrid of sorting approaches with insertion sort being used for small (<20 element) unsorted partitions.

// Insertion sort is more like a bitshift where all the cards are shifted to the left unit it reaches its correct position, the best case and fastest scenario for insertion sort would be if the data was aleready sorted.

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

example(of: "insertion sort") {
  var array = [9, 4, 10, 3]
  print("Original: \(array)")
  insertionSort(&array)
  print("Insertion sorted: \(array)")
}
