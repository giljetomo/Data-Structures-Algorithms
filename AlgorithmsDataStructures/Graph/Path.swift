//
//  Path.swift
//  AlgorithmsDataStructures
//
//  Created by Macbook Pro on 2021-03-25.
//

import Foundation

func shortestPath() {
  let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
  let n = firstLine[0]
  let validNodes = readLine()!.split(separator: " ").map { Int($0)! }
  
  var adjList = [[Int]](repeating: [], count: n)
  for _ in 0..<n-1 {
    let nodes = readLine()!.split(separator: " ").map { Int($0)! }
    let u = nodes[0]
    let v = nodes[1]
    
    adjList[u].append(v)
    adjList[v].append(u)
  }
  
  //algorithm not yet implemented
  func dfs(vertex: Int, adjList: inout [[Int]], visited: inout [Bool]) {
    visited[vertex] = true
    for v in adjList[vertex] {
      if !visited[v] {
        dfs(vertex: v, adjList: &adjList, visited: &visited)
      }
    }
  }
  
  var visited = [Bool](repeating: false, count: n)
  for v in validNodes {
    if !visited[v] {
      dfs(vertex: v, adjList: &adjList, visited: &visited)
    }
  }
  
  
}
