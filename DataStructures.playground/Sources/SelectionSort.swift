import Foundation

// SelectionSort it looks for the lowest value and then swaps it to the front of the array

//public func selectionSort<Element>(_ array: inout [Element])
//    where Element: Comparable {
//  guard array.count >= 2 else {
//    return
//  }
//  // 1 You perform a pass for every element in the collection, except for the last one. There is no need to include the last element, since if all other elements are in teh right order then the last one must be as well.
//  for current in 0..<(array.count - 1) {
//    var lowest = current
//    // 2 In every pass, you go through the remainder of the collection to find the element with the lowest value.
//    for other in (current + 1)..<array.count {
//      if array[lowest] > array[other] {
//        lowest = other
//      }
//    }
//    // 3 If that element is not the current element, swap them.
//    if lowest != current {
//      array.swapAt(lowest, current)
//    }
//  }
//}

//___________________________________________________________________________________________________
// This is the generic version of the above code

public func selectionSort<T>(_ collection: inout T)
    where T: MutableCollection, T.Element: Comparable {
  guard collection.count >= 2 else {
    return
  }
  for current in collection.indices {
    var lowest = current
    var other = collection.index(after: current)
    while other < collection.endIndex {
      if collection[lowest] > collection[other] {
        lowest = other
      }
      other = collection.index(after: other)
    }
    if lowest != current {
      collection.swapAt(lowest, current)
    }
  }
}
