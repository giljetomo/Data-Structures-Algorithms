//
//  Stack.swift
//  AlgorithmsDataStructures
//
//  Created by Macbook Pro on 2021-03-15.
//

import Foundation

public final class Stack<E>: Sequence {
  /// beginning of stack
  private var first: Node<E>? = nil
  
  /// number of elements in stack
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
  
  /// Initializes an empty stack.
  public init() {}
  
  /// Returns true if this stack is empty.
  /// - Returns: true if this stack is empty, otherwise false.
  public func isEmpty() -> Bool {
    return first == nil
  }
  
  /// Pushes an item to the stack
  /// - Parameter item: the item to push into top of the stack
  public func push(item: E) {
    let topItem = first
    first = Node<E>(item: item, next: topItem)
    count += 1
  }
  
  /// Pops an item from the stack
  /// - Returns: the item removed from the top of the stack
  public func pop() -> E? {
    let topItem = first?.item
    
    guard let nextItem = first?.next else {
      first = nil
      count = 0
      return topItem
    }
    
    first = Node<E>(item: nextItem.item, next: nextItem.next)
    count -= 1
    return topItem
  }
  
  /// See the top item without removing it from the stack
  /// - Returns: the item on top of the stack
  public func peek() -> E? {
    return first?.item
  }
  
  public struct StackIterator<E> : IteratorProtocol {
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
  
  /// Returns an iterator that iterates over the items in the stack from top to bottom
  public func makeIterator() -> StackIterator<E> {
    return StackIterator<E>(first)
  }
}

extension Stack: CustomStringConvertible {
  public var description: String {
    return self.map( { "\($0)" } ).joined(separator: ", ")
  }
}
