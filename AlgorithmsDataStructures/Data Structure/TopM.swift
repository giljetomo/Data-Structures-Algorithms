//
//  TopM.swift
//  AlgorithmsDataStructures
//
//  Created by Macbook Pro on 2021-03-16.
//

import Foundation


public final class TopM<E: Comparable> {
  
  /// store heap as fixed array.  root:x , left: 2*x+1, right: 2*x+2
  fileprivate var heap: Array<E?>
  /// store heap size. This is for efficiency.
  private var count: Int = 0
  /// max count that heap can store.
  private let heapMaxSize: Int
  
  private let comparator: (E, E) -> Bool
  
  // init heap array
  init(m: Int, comparator: @escaping (E, E) -> Bool) {
    self.heapMaxSize = m
    self.heap = Array(repeating: nil, count: m)
    self.comparator = comparator
  }

  
  /// remove and return the top (first) element
  /// re-order the heap structure after that (top -> bottom)
  @discardableResult private func delete() -> E? {
    // remove
    if count == 0 {return nil}
    let deleteItem = heap[0]
    heap.swapAt(0, count - 1)
    heap[count - 1] = nil
    count -= 1
    
    // re-order
    var index = 0
    while index < count - 1 {
      // find the next child index to swap
      let leftChildIndex = index*2 + 1
      let rightChildIndex = index*2 + 2
      let nextChildIndex: Int
    
      if leftChildIndex >= count {  // L nil R nil
//      if leftChildIndex >= count {  // L nil R nil
        // no need to swap, so stop and return deleted item
        break
      } else if rightChildIndex >= count { // L non-nil R nil
        nextChildIndex = leftChildIndex
      } else { // L non-nil, R non-nil
        // find the closet node as first element
        // eg, Max heap, root: 34,  l:50, r: 100 -> we should swap 34 and 100
        nextChildIndex = heap[leftChildIndex]! > heap[rightChildIndex]! ? leftChildIndex : rightChildIndex
//        nextChildIndex = comparator(heap[leftChildIndex]!, heap[rightChildIndex]!) ? leftChildIndex : rightChildIndex
      }
      // check if we have to swap
      if comparator(heap[index]!, heap[nextChildIndex]!) {
//      if heap[index]! < heap[nextChildIndex]! {
        heap.swapAt(index, nextChildIndex)
        index = nextChildIndex
      }else{
        // no need to swap, so stop and return deleted item
        break
      }
    }
    
    return deleteItem
  }
  
  
  /// insert element to the end
  /// re-order the heap structure after that  (bottom -> top)
  private func insert(item: E) {
    // insert to last
    heap[count] = item
    
    // re-order
    var index = count
    while index > 0 {
      // try to look parent, if exist, compare and swap
      let parentIndex = (index - 1)/2 // round down
      if let currentNode = heap[index],
         let parentNode = heap[parentIndex],
         currentNode > parentNode
      {
        heap.swapAt(index, parentIndex)
        index = parentIndex
      }else{
        break
      }
    }
    
    count += 1
  }
  
  
  /// Return top M elements
  /// - Returns: array of top M, without nil
  func fetch() -> Array<E?> {
    return heap.compactMap({$0})
  }

  
  /// Try to add new item to top M heap.
  /// - Parameter item: item you are trying to add
  /// - Returns: if the item successfully added to top M, otherwise false.
  @discardableResult func feed(item: E) -> Bool{
    // if there are still rooms for heap, you can add any item
    if count < heapMaxSize {
      insert(item: item)
      return true
    }
    
    // if the item is larger (smaller) than first element of heap, we can't add to heap. ignore.
    let topItem = heap.first!!
    if comparator (topItem, item) {
//    if topItem < item {
      return false
    }
    
    // otherwise, delete top and insert new item
    self.delete()
    self.insert(item: item)
    return true
  }
}

extension TopM: CustomStringConvertible {
  public var description: String {
    return heap.compactMap({$0}).description
  }
}

