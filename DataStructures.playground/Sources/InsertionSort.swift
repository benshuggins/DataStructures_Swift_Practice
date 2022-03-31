// Insertion Sort
import Foundation

public func insertionSort<Element>(_ array: inout [Element])
    where Element: Comparable {
  guard array.count >= 2 else {
    return
  }
  // 1 Insertion sort requires you to iterate from left to right, once. This loop does that.
  for current in 1..<array.count {
    // 2 Here, you run backwards from the current index so you can shift left as needed.  shifting ?
    for shifting in (1...current).reversed() {
      // 3 Keep shifting the element left as long as necessary. As soon as the element is in position, break the inner loop and start with the next element.
      if array[shifting] < array[shifting - 1] {
        array.swapAt(shifting, shifting - 1)
      } else {
        break
      }
    }
  }
}
