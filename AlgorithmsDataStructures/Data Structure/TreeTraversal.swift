//
//  TreeTraversal.swift
//  AlgorithmsDataStructures
//
//  Created by Derrick Park on 2021-03-16.
//

import Foundation

// Leetcode Pattern (Binary Leetcode)
//class TreeNode<T> {
//  var data: T?
//  var left: TreeNode<T>?
//  var right: TreeNode<T>?
//}

func treeTraversal() {
  var tree = [[Int]](repeating: [Int](repeating: 0, count: 2), count: 26)
  let n = Int(readLine()!)!
  for _ in 0..<n {
    // nodeInfo = ["A", "B", "C"]
    let nodeInfo = readLine()!.split(separator: " ").map { String($0) }
    let parent = Int(Character(nodeInfo[0]).asciiValue! - 65)
    let left = Int(Character(nodeInfo[1]).asciiValue!)
    let right = Int(Character(nodeInfo[2]).asciiValue!)
    // ascii for . is 46 -> -1
    tree[parent][0] = left == 46 ? -1 : left - 65
    tree[parent][1] = right == 46 ? -1 : right - 65
  }
  
  func preOrder(_ node: Int) {
    if node == -1 { return }
    print(Character(UnicodeScalar(node + 65)!), terminator: "")
    preOrder(tree[node][0])
    preOrder(tree[node][1])
  }
  
  func inOrder(_ node: Int) {
    if node == -1 { return }
    inOrder(tree[node][0])
    print(Character(UnicodeScalar(node + 65)!), terminator: "")
    inOrder(tree[node][1])
  }
  
  func postOrder(_ node: Int) {
    if node == -1 { return }
    postOrder(tree[node][0])
    postOrder(tree[node][1])
    print(Character(UnicodeScalar(node + 65)!), terminator: "")
  }

  preOrder(0)
  print()
  inOrder(0)
  print()
  postOrder(0)
  print()
}

// reservedTime = [41, 46, 49, 56]
// currentTime = 37
// k = 3
//
// runwayReservation(reservedTime, k, currentTime, 44) -> false
// runwayReservation(reservedTime, k, currentTime, 53) -> true
// runwayReservation(reservedTime, k, currentTime, 20) -> false
// Time complexity: O(lg N)
func runwayReservation(reservedTimes: [Int], _ k: Int, currentTime: Int, requestTime: Int) -> Bool {
  if requestTime < currentTime {
    return false
  }
  
  // Exercise
  return true
}
