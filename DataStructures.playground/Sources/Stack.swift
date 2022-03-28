import Foundation

// This is the backing storage of our stack, we are using an array, offering constant time insertions and deletions at one end of the array via append and popLast, this is LIFO or last in first out

// THE Point of stacks are to limit the number of ways to access your data, adding Collection protocol conformance which would expose all elemenst via Iterators and indexes

public struct Stack<Element> {

  private var storage: [Element] = []

  public init() { }
    
    public init(_ elements: [Element]) {
      storage = elements
    }
}


extension Stack: CustomStringConvertible {

  public var description: String {
    """
    ----top----
    \(storage.map { "\($0)" }.reversed().joined(separator: "\n"))
    -----------
    """
  }
    
    public mutating func push(_ element: Element) {
      storage.append(element)
    }

    @discardableResult
    public mutating func pop() -> Element? {
      storage.popLast()
    }
    // Peek allows you to look at the top element wihout changing any contents
    public func peek() -> Element? {
     storage.last
    }

    public var isEmpty: Bool {
      peek() == nil
    }
}

// The above code basicalluy makes our stack human readable and customizable

// This allows us to create a stack from an array literal
extension Stack: ExpressibleByArrayLiteral {
  public init(arrayLiteral elements: Element...) {
    storage = elements
  }
}
