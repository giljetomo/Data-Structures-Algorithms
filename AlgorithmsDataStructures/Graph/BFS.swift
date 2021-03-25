//
//  BFS.swift
//  AlgorithmsDataStructures
//
//  Created by Derrick Park on 2021-03-23.
//

import Foundation

func adjacencyListBFS() {
  let firstLine = readLine()!.split(separator: " ")
  let n = Int(firstLine[0])!
  let m = Int(firstLine[1])!
  
  var adjList = [[Int]](repeating: [], count: n + 1)
  
  for _ in 0..<m {
    let edge = readLine()!.split(separator: " ")
    let u = Int(edge[0])!
    let v = Int(edge[1])!
    
    adjList[u].append(v)
    adjList[v].append(u)
  }
  
  var visited = [Bool](repeating: false, count: n + 1)
  let queue = Queue<Int>()
  queue.enqueue(item: 1)
  visited[1] = true
  
  while !queue.isEmpty() {
    let vertex = queue.dequeue()!
    print(vertex)
    for v in adjList[vertex] {
      if !visited[v] {
        queue.enqueue(item: v)
        visited[v] = true
      }
    }
  }
}
