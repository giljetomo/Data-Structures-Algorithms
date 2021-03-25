//
//  CyclicPermutation.swift
//  AlgorithmsDataStructures
//
//  Created by Gil Jetomo on 2021-03-23.
//

import Foundation

func cyclicPermutation() {
  let n = Int(readLine()!)!
  
  for _ in 0..<n {
    let num = Int(readLine()!)!
    let elements = readLine()!.split(separator: " ").map { Int($0)! }
    var adjList = [[Int]](repeating: [], count: num + 1)
    
    for e in 0..<num {
      let v = elements[e]
      //unidirectional
      adjList[e + 1].append(v)
    }
    
    func dfs(vertex: Int, adjList: inout [[Int]], visited: inout [Bool]) {
      visited[vertex] = true
      for v in adjList[vertex] {
        if !visited[v] {
          dfs(vertex: v, adjList: &adjList, visited: &visited)
        }
      }
    }
    
    var visited = [Bool](repeating: false, count: num + 1)
    var count = 0
    for v in 1...num {
      if !visited[v] {
        dfs(vertex: v, adjList: &adjList, visited: &visited)
        count += 1
      }
    }
    print(count)
  }
}
