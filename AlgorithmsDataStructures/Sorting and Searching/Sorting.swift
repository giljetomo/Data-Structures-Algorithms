//
//  Sorting.swift
//  AlgorithmsDataStructures
//
//  Created by Derrick Park on 2021-03-12.
//

import Foundation

// Fastest sorting algortihm so far: O(Nlg N)

// 1. Bubble Sort
// Time Complexity: O(N^2)
// Space Complexity: O(N)
func bubbleSort<T: Comparable>(_ arr: [T], _ comparator: (T, T) -> Bool) -> [T] {
  guard arr.count > 1 else { return arr }
  var elements = arr
  for i in 0..<elements.count - 1 {
    for j in 1..<elements.count - i {
      if comparator(elements[j], elements[j - 1]) {
        let temp = elements[j-1]
        elements[j - 1] = elements[j]
        elements[j] = temp
      }
    }
  }
  return elements
}

// 2. Selection Sort
// Time Complexity: O(N^2)
// Space Complexity: O(N)
func selectionSort<T: Comparable>(_ arr: [T], _ comparator: (T, T) -> Bool) -> [T] {
  guard arr.count > 1 else { return arr }
  var elements = arr
  for i in 0..<elements.count - 1 {
    var indexMin = i
    for j in i+1..<elements.count {
      if comparator(elements[j], elements[indexMin]) {
        indexMin = j
      }
    }
    if i != indexMin {
      elements.swapAt(indexMin, i)
    }
  }
  return elements
}

// 3. Insertion Sort
// Time Complexity: O(N^2)
// Space Complexity: O(N)
func insertionSort<T: Comparable>(_ arr: [T], _ comparator: (T, T) -> Bool) -> [T] {
  guard arr.count > 1 else { return arr }
  var elements = arr
  for i in 1..<elements.count {
    var j = i
    let elemToInsert = elements[i]
    while j > 0 && comparator(elemToInsert, elements[j - 1]) {
      elements[j] = elements[j - 1]
      j -= 1
    }
    elements[j] = elemToInsert
  }
  return elements
}

// 4. Merge Sort
// Time Complexity: O(Nlg N)
// Space Complexity: O(N)
func mergeSort<T: Comparable>(_ arr: [T], _ comparator: (T, T) -> Bool) -> [T] {
  guard arr.count > 1 else { return arr }
  
  let mid = arr.count / 2
  let sortedLeft = mergeSort(Array(arr[0..<mid]), comparator)
  let sortedRight = mergeSort(Array(arr[mid...]), comparator)
  return merge(sortedLeft, sortedRight, comparator)
}

func merge<T: Comparable>(_ left: [T], _ right: [T], _ comparator: (T, T) -> Bool) -> [T] {
  var i = 0
  var j = 0
  var merged: [T] = []
  while true {
    guard i < left.count else {
      merged.append(contentsOf: right[j...])
      break
    }
    guard j < right.count else {
      merged.append(contentsOf: left[i...])
      break
    }
    if comparator(left[i], right[j]) {
      merged.append(left[i])
      i += 1
    } else {
      merged.append(right[j])
      j += 1
    }
  }
  return merged
}

// 5. Quick Sort (Assignment) - O(Nlg N)

// 6. Heap Sort (later) - O(Nlg N)

