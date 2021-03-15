//
//  Searching.swift
//  AlgorithmsDataStructures
//
//  Created by Derrick Park on 2021-03-12.
//

import Foundation

/// Linear Search - O(N)
/// Returns the index of the given target value from the collection. Otherwise, nil
/// - Parameters:
///   - collection: an array of equatable objects
///   - target: the target
/// - Returns: the index of the given target value from the collection. Otherwise, nil
func linearSearch<T: Equatable>(_ collection: [T], _ target: T) -> Int? {
  for (index, element) in collection.enumerated() where element == target {
    return index
  }
  return nil
}

/// Binary Search - O(lg N)
/// Returns the index of the given target value from the collection. Otherwise, nil
/// * Pre-condition: elements in the collection MUST be sorted.
/// - Parameters:
///   - collection: an array of comparable objects
///   - target: the target
/// - Returns: the index of the given target value from the collection. Otherwise, nil
func binarySearch<T: Comparable>(_ collection: [T], _ target: T) -> Int? {
  var lower = 0
  var upper = collection.count - 1
  
  while lower <= upper {
    let mid = (lower + upper) / 2
    if collection[mid] == target {
      return mid
    } else if collection[mid] < target {
      lower = mid + 1
    } else {
      upper = mid - 1
    }
  }
  return nil
}
