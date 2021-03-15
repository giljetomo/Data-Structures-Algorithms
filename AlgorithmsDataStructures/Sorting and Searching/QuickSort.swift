//
//  QuickSort.swift
//  AlgorithmsDataStructures
//
//  Created by Gil Jetomo on 2021-03-14.
//

import Foundation

func quickSort<T: Comparable>(_ collection: [T], _ comparator: (T, T)-> Bool) -> [T] {
  var arr = collection
  quickSortHelper(&arr, 0, arr.count - 1, comparator)
  return arr
}

func quickSortHelper<T: Comparable>(_ collection: inout [T],
                                    _ start: Int,
                                    _ end: Int,
                                    _ comparator: (T, T)-> Bool) {
  if start < end {
    let partitionIndex = partition(&collection, start, end, comparator)
    quickSortHelper(&collection, start, partitionIndex - 1, comparator)
    quickSortHelper(&collection, partitionIndex + 1, end, comparator)
  }
}

func partition<T: Comparable>(_ collection: inout [T],
                              _ start: Int,
                              _ end: Int,
                              _ comparator: (T, T)-> Bool) -> Int {
  //randomly pick a pivot so that time complexity does not end up n^2 when the collection is already sorted
  let randomIndex = Int.random(in: start..<end)
  collection.swapAt(randomIndex, end)
  let pivot = collection[end]
  
  var partitionIndex = start
  for i in start..<end {
    if comparator(collection[i], pivot) {
      collection.swapAt(i, partitionIndex)
      partitionIndex += 1
    }
  }
  collection.swapAt(partitionIndex, end)
  return partitionIndex
}
