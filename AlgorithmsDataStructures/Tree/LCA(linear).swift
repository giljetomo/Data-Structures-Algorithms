//
//  LCA(linear).swift
//  AlgorithmsDataStructures
//
//  Created by Derrick Park on 2021-03-24.
//

import Foundation

func lcaLinear() {
  let n = Int(readLine()!)!
  var adjList = [[Int]](repeating: [], count: n + 1)
  var check = [Bool](repeating: false, count: n + 1)
  var depth = [Int](repeating: 0, count: n + 1)
  var parent = [Int](repeating: 0, count: n + 1)
  
  for _ in 0..<n-1 {
    let edge = readLine()!.split(separator: " ").map { Int($0)! }
    let u = edge[0]
    let v = edge[1]
    adjList[u].append(v)
    adjList[v].append(u)
  }
  
  // Preprocessing (depth, parent of each node)
  depth[1] = 0
  check[1] = true
  let q = Queue<Int>()
  q.enqueue(item: 1)
  
  while !q.isEmpty() {
    let u = q.dequeue()!
    for v in adjList[u] {
      if !check[v] {
        depth[v] = depth[u] + 1
        parent[v] = u
        check[v] = true
        q.enqueue(item: v)
      }
    }
  }
  
  var m = Int(readLine()!)!
  while m > 0 {
    // LCA algorithm O(n)
    let nodes = readLine()!.split(separator: " ").map { Int($0)! }
    var n1 = nodes[0]
    var n2 = nodes[1]
    if depth[n1] < depth[n2] {
      swap(&n1, &n2)
    }
    // consider n1 being the deeper node
    while depth[n1] != depth[n2] {
      n1 = parent[n1]
    }
    
    while n1 != n2 {
      n1 = parent[n1]
      n2 = parent[n2]
    }

    print(n1)
    m -= 1
  }
}
