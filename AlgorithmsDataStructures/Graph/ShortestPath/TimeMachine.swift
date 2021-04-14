//
//  TimeMachine.swift
//  SwiftAGDS
//
//  Created by Derrick Park on 8/5/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import Foundation

func TimeMachine() {
  let first = readLine()!.split(separator: " ").map { Int($0)! }
  let n = first[0]
  let m = first[1]
  var edges = [(u: Int, v: Int, w: Int)]()
  var dist = [Int](repeating: Int.max, count: n + 1)
  for _ in 0..<m {
    let edge = readLine()!.split(separator: " ").map { Int($0)! }
    edges.append((u: edge[0], v: edge[1], w: edge[2]))
  }
  
  var negativeCycle = false
  for i in 0..<n { // n times to detect negative cycle
    for edge in edges {
      if dist[edge.u] != Int.max && dist[edge.v] > dist[edge.u] + edge.w {
        dist[edge.v] = dist[edge.u] + edge.w
        if i == n - 1 { // n'th iteration
          negativeCycle = true
        }
      }
    }
  }
  
  if negativeCycle {
    print(-1)
  } else {
    for v in 2...n {
      if dist[v] == Int.max {
        dist[v] = -1
      }
      print(dist[v])
    }
  }
}
