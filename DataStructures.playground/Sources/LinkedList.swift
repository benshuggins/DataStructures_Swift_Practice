import Foundation

public struct LinkedList<Value> {

  public var head: Node<Value>?
  public var tail: Node<Value>?
  
  public init() {}

  public var isEmpty: Bool {
    head == nil
  }
}

extension LinkedList: CustomStringConvertible {

  public var description: String {
    guard let head = head else {
      return "Empty list"
    }
    return String(describing: head)
  }
    //_________________________________________________________________________________________________________
    // This is like a convenience addition that allows the ability to push or add a node to the front of the list
    public mutating func push(_ value: Value) {
      head = Node(value: value, next: head)
      if tail == nil {
        tail = head
      }
    }
    
    //_________________________________________________________________________________________________________
    // add a node to the end of the list  tail end insertion 
    public mutating func append(_ value: Value) {

      // 1 Like before, if the list is empty, you’ll need to update both head and tail to the new node. Since append on an empty list is functionally identical to push, you simply invoke push to do the work for you.
      guard !isEmpty else {
        push(value)
        return
      }
      
      // 2 In all other cases, you simply create a new node after the tail node. Force unwrapping is guaranteed to succeed since you push in the isEmpty case with the above guard statement.
      tail!.next = Node(value: value)
      
      // 3 Since this is tail-end insertion, your new node is also the tail of the list
      tail = tail!.next
    }
    
//    node(at:) will try to retrieve a node in the list based on the given index. Since you can only access the nodes of the list from the head node, you’ll have to make iterative traversals. Here’s the play-by-play:
    public func node(at index: Int) -> Node<Value>? {
      // 1 You create a new reference to head and keep track of the current number of traversals.
      var currentNode = head
      var currentIndex = 0
      
      // 2 Using a while loop, you move the reference down the list until you’ve reached the desired index. Empty lists or out-of-bounds indexes will result in a nil return value.
      while currentNode != nil && currentIndex < index {
        currentNode = currentNode!.next
        currentIndex += 1
      }
      
      return currentNode
    }
    
    // 1  This is where we actually insert a new node
//    @discardableResult lets callers ignore the return value of this method without the compiler jumping up and down warning you about it.
    @discardableResult
    public mutating func insert(_ value: Value,
                                after node: Node<Value>)
                                -> Node<Value> {
      // 2 In the case where this method is called with the tail node, you’ll call the functionally equivalent append method. This will take care of updating tail.
      guard tail !== node else {
        append(value)
        return tail!
      }
      // 3 Otherwise, you simply link up the new node with the rest of the list and return the new node.
      node.next = Node(value: value, next: node.next)
      return node.next!
    }
    
    // POP - remove from the front of the list
    @discardableResult
    public mutating func pop() -> Value? {
      defer {
        head = head?.next
        if isEmpty {
          tail = nil
        }
      }
      return head?.value
    }
    
    // _______________________________removeLast Operations ______________________________________________
    @discardableResult
    public mutating func removeLast() -> Value? {
      // 1 If head is nil, there’s nothing to remove, so you return nil.
      guard let head = head else {
        return nil
      }
      // 2 If the list only consists of one node, removeLast is functionally equivalent to pop. Since pop will handle updating the head and tail references, you’ll just delegate this work to it.
      guard head.next != nil else {
        return pop()
      }
      // 3 You keep searching for a next node until current.next is nil. This signifies that current is the last node of the list.
      var prev = head
      var current = head
      
      while let next = current.next {
        prev = current
        current = next
      }
      // 4 Since current is the last node, you simply disconnect it using the prev.next reference. You also make sure to update the tail reference.
      prev.next = nil
      tail = prev
      return current.value
    }
    
//    remove(after:) operations
//    The final remove operation is removing a particular node at a particular point in the list. This is achieved much like insert(after:); You’ll first find the node immediately before the node you wish to remove, and then unlink it.
    
    @discardableResult
    public mutating func remove(after node: Node<Value>) -> Value? {
        defer { // this is where the unlinking of nodes occurs The unlinking of the nodes occurs in the defer block. Special care needs to be taken if the removed node is the tail node, since the tail reference will need to be updated.
        if node.next === tail {
          tail = node
        }
        node.next = node.next?.next
      }
      return node.next?.value
    }
    
}
// THis allows for indexing into a Collection type
extension LinkedList: Collection {

  public struct Index: Comparable {

    public var node: Node<Value>?
    
    static public func ==(lhs: Index, rhs: Index) -> Bool {
      switch (lhs.node, rhs.node) {
      case let (left?, right?):
        return left.next === right.next
      case (nil, nil):
        return true
      default:
        return false
      }
    }
    
    static public func <(lhs: Index, rhs: Index) -> Bool {
      guard lhs != rhs else {
        return false
      }
      let nodes = sequence(first: lhs.node) { $0?.next }
      return nodes.contains { $0 === rhs.node }
    }
  }
    
    //https://www.raywenderlich.com/books/data-structures-algorithms-in-swift/v3.0/chapters/6-linked-list
    
    // 1 The startIndex is reasonably defined by the head of the linked list.
    public var startIndex: Index {
      Index(node: head)
    }
    // 2 Collection defines the endIndex as the index right after the last accessible value, so you give it tail?.next.
    public var endIndex: Index {
      Index(node: tail?.next)
    }
    // 3 index(after:) dictates how the index can be incremented. You simply give it an index of the immediate next node.
    public func index(after i: Index) -> Index {
      Index(node: i.node?.next)
    }
    // 4 The subscript is used to map an Index to the value in the collection. Since you’ve created the custom index, you can easily achieve this in constant time by referring to the node’s value.
    public subscript(position: Index) -> Value {
      position.node!.value
    }
}
