////
////  Stack.swift
////  AlgorithmsDataStructures
////
////  Created by Gil Jetomo on 2021-03-15.
////
//
//import Foundation
///// The **Queue** class represents a queue of generic items.
///// It supports enqueueing, dequeueing, and iterating over the items
///// in the order they are enqueued from the first item in the rear to the last item in the front
///// This implementation uses a singly linked list with an inner class Node.
///// The *enqueue*, *dequeue*, *peek*, *isEmpty*, and *count* operations take constant time *O(1)*. Iteration takes linear time *O(n)
//public final class Queue<E>: Sequence {
//  /// beginning of queue
//  private var front: Node<E>? = nil
//  private var rear: Node<E>? = nil
//
//  /// number of elements in the queue
//  private(set) var count: Int = 0
//
//  /// helper linked list node class
//  fileprivate class Node<E> {
//    fileprivate var item: E
//    fileprivate var next: Node<E>?
//    fileprivate init(item: E, next: Node<E>? = nil) {
//      self.item = item
//      self.next = next
//    }
//  }
//
//  /// Initializes an empty queue.
//  public init() {}
//
//  /// Returns true if this queue is empty.
//  /// - Returns: true if this queue is empty, otherwise false.
//  public func isEmpty() -> Bool {
//    return front == nil
//  }
//
//  /// Enqueues an item to the queue
//  /// - Parameter item: the item to enqueue into the rear of the queue
//  public func enqueue(item: E) {
//    count += 1
//    let temp = Node<E>(item: item)
//
//    if rear == nil {
//      front = temp
//      rear = temp
//      return
//    }
//    //assign the new item as the 'next' property of the current rear
//    rear?.next = temp
//    //update rear as the new item
//    rear = temp
//  }
//
//  /// Dequeue an item from the queue
//  /// - Returns: the item removed from the front of the stack
//  public func dequeue() -> E? {
//    guard let currentFront = front else { return nil }
//    count -= 1
//    front = currentFront.next
//    return currentFront.item
//  }
//
//  /// See the front item without removing it from the queue
//  /// - Returns: the item on the front of the queue
//  public func peek() -> E? {
//    return front?.item
//  }
//
//  public struct QueueIterator<E> : IteratorProtocol {
//    public typealias Element = E
//
//    private var current: Node<E>?
//
//    fileprivate init(_ first: Node<E>?) {
//      self.current = first
//    }
//
//    public mutating func next() -> E? {
//      if let item = current?.item {
//        current = current?.next
//        return item
//      }
//      return nil
//    }
//  }
//
//  /// Returns an iterator that iterates over the items in the queue from front to rear
//  public func makeIterator() -> QueueIterator<E> {
//    return QueueIterator<E>(front)
//  }
//}
//
//extension Queue: CustomStringConvertible {
//  public var description: String {
//    return self.map( { "\($0)" } ).joined(separator: ", ")
//  }
//}


//
//  Queue.swift
//  SwiftAlgorithmsDataStructures
//
//  Created by Derrick Park on 2/12/20.
//  Copyright ?? 2020 Derrick Park. All rights reserved.
//

import Foundation

/// The Queue class represents a first-in-first-out (FIFO) queue of generic items.
/// It supports the usual *eunque* and *dequeue* operations, along with methods for peeking at the first item, testing if the queue is empty, and iterating through the items in FIFO order.
/// This implementation uses a singly linked list with an inner class for linked list nodes.
public final class Queue<E> : Sequence {
    /// beginning of queue
    private var first: Node<E>? = nil
    /// end of queue
    private var last: Node<E>? = nil
    /// size of the queue
    private(set) var count: Int = 0
    
    /// helper linked list node class
    fileprivate class Node<E> {
        fileprivate var item: E
        fileprivate var next: Node<E>?
        fileprivate init(item: E, next: Node<E>? = nil) {
            self.item = item
            self.next = next
        }
    }
    
    /// Initializes an empty queue.
    public init() {}
    
    /// Returns true if this queue is empty.
    public func isEmpty() -> Bool {
        return first == nil
    }
    
    /// Returns the item least recently added to this queue.
    public func peek() -> E? {
        return first?.item
    }
    
    /// Adds the item to this queue
    /// - Parameter item: the item to add
    public func enqueue(item: E) {
        let oldLast = last
        last = Node<E>(item: item)
        if isEmpty() { first = last }
        else { oldLast?.next = last }
        count += 1
    }
    
    /// Removes and returns the item on this queue that was least recently added.
    public func dequeue() -> E? {
        if let item = first?.item {
            first = first?.next
            count -= 1
            // to avoid loitering
            if isEmpty() { last = nil }
            return item
        }
        return nil
    }
    
    /// QueueIterator that iterates over the items in FIFO order.
    public struct QueueIterator<E> : IteratorProtocol {
        private var current: Node<E>?
        
        fileprivate init(_ first: Node<E>?) {
            self.current = first
        }
        
        public mutating func next() -> E? {
            if let item = current?.item {
                current = current?.next
                return item
            }
            return nil
        }
        
        public typealias Element = E
    }
    
    /// Returns an iterator that iterates over the items in this Queue in FIFO order.
    public __consuming func makeIterator() -> QueueIterator<E> {
        return QueueIterator<E>(first)
    }
}

extension Queue: CustomStringConvertible {
    public var description: String {
        return self.reduce(into: "") { $0 += "\($1) " }
    }
}
