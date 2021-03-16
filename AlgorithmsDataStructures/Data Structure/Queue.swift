//
//  Stack.swift
//  AlgorithmsDataStructures
//
//  Created by Gil Jetomo on 2021-03-15.
//

import Foundation

public final class Queue<E>: Sequence {
  /// beginning of queue
  private var front: Node<E>? = nil
  private var rear: Node<E>? = nil
  
  /// number of elements in the queue
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
  /// - Returns: true if this queue is empty, otherwise false.
  public func isEmpty() -> Bool {
    return front == nil
  }
  
  /// Enqueues an item to the queue
  /// - Parameter item: the item to enqueue into the rear of the queue
  public func enqueue(item: E) {
    count += 1
    let temp = Node<E>(item: item)
    
    if rear == nil {
      front = temp
      rear = temp
      return
    }
    //assign the new item as the 'next' property of the current rear
    rear?.next = temp
    //update rear as the new item
    rear = temp
  }
  
  /// Dequeue an item from the queue
  /// - Returns: the item removed from the front of the stack
  public func dequeue() -> E? {
    guard let currentFront = front else { return nil }
    count -= 1
    front = currentFront.next
    return currentFront.item
  }
  
  /// See the front item without removing it from the queue
  /// - Returns: the item on the front of the queue
  public func peek() -> E? {
    return front?.item
  }
  
  public struct QueueIterator<E> : IteratorProtocol {
    public typealias Element = E
    
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
  }
  
  /// Returns an iterator that iterates over the items in the queue from front to rear
  public func makeIterator() -> QueueIterator<E> {
    return QueueIterator<E>(front)
  }
}

extension Queue: CustomStringConvertible {
  public var description: String {
    return self.map( { "\($0)" } ).joined(separator: ", ")
  }
}
