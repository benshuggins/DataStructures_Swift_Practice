import Foundation

// this is an action closure and I would like to investigate this further // 

public func example(of description: String, action: () -> ()) {
  print("---Example of \(description)---")
  action()
  print()
}
