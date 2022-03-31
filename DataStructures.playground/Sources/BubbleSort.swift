import Foundation

// Bubble sort has a best case scenario of O(n) and a worst case scenario of O(n^2) making it one of the least appealing sorts in the universe.




//// inout can mutate original variable and pass back without return
//public func bubbleSort<Element>(_ array: inout [Element])
//    where Element: Comparable {
//  // 1 There is no need to sort the collection if it has less than two elements.
//  guard array.count >= 2 else {
//    return
//  }
//  // 2 A single-pass bubbles the largest value to the end of the collection. Every pass needs to compare one less value than in the previous pass, so you essentially shorten the array by one with each pass.
//  for end in (1..<array.count).reversed() {
//    var swapped = false
//    // 3 This loop performs a single pass; it compares adjacent values and swaps them if needed.
//    for current in 0..<end {
//      if array[current] > array[current + 1] {
//        array.swapAt(current, current + 1)
//        swapped = true
//      }
//    }
//    // 4 If no values were swapped this pass, the collection must be sorted, and you can exit early.
//    if !swapped {
//      return
//    }
//  }
//}


public func bubbleSort<T>(_ collection: inout T)
    where T: MutableCollection, T.Element: Comparable {
  guard collection.count >= 2 else {
      return
  }
  for end in collection.indices.reversed() {
    var swapped = false
    var current = collection.startIndex
    while current < end {
      let next = collection.index(after: current)
      if collection[current] > collection[next] {
        collection.swapAt(current, next)
        swapped = true
      }
      current = next
    }
    if !swapped {
      return
    }
  }
}
