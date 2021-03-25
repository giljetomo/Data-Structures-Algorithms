//
//  AdjacencyList.swift
//  AlgorithmsDataStructures
//
//  Created by Derrick Park on 2021-03-23.
//

import Foundation

// weighted undirected graph
func adjacencyListRepresentation() {
  let firstLine = readLine()!.split(separator: " ")
  let n = Int(firstLine[0])!
  let m = Int(firstLine[1])!
  
  var adjList = [[(v: Int, w: Int)]](repeating: [], count: n + 1)
  
  for _ in 0..<m {
    let edge = readLine()!.split(separator: " ")
    let u = Int(edge[0])!
    let v = Int(edge[1])!
    let w = Int(edge[2])!
    
    adjList[u].append((v, w))
    adjList[v].append((u, w))
  }
  
  for l in adjList {
    print(l)
  }
}
