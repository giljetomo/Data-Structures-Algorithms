//
//  LowestCommonAncestor.swift
//  AlgorithmsDataStructures
//
//  Created by Macbook Pro on 2021-03-18.
//

import Foundation

func LCA() {
  let size = Int(readLine()!)!
  var tree = [[Int]](repeating: [0], count: size)
  
  for _ in 0..<size - 1 {
    let nodeInfo = readLine()!.split(separator: " ").map { String($0) }
    let parent = Int(nodeInfo[0])! - 1
    let child = Int(nodeInfo[1])! - 1
    
    if tree[parent].contains(0) {
      tree[parent].removeAll()
    }
    if tree[child].first != 0 {
      tree[child].append(parent)
    } else {
      tree[parent].append(child)
    }
    if tree[child].contains(0) {
      tree[child].removeAll()
    }
  }
  
  func traverse(nodes: [Int]) {
    print(nodes)
  }
  
  let searchCount = Int(readLine()!)!
  for _ in 0..<searchCount {
    let nodeInfo = readLine()!.split(separator: " ").map { String($0) }
    traverse(nodes: nodeInfo.map { Int($0)! })
  }
  
  
}
