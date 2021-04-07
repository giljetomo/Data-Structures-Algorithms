//
//  ShortestBridge.swift
//  AlgorithmsDataStructures
//
//  Created by Macbook Pro on 2021-04-07.
//

import Foundation

func islands() {
  
  struct Square {
    let x: Int
    let y: Int
  }
  
  let dx = [0, 0, 1, -1]
  let dy = [1, -1, 0, 0]
  
  var map = [[Int]]()
  let n = Int(readLine()!)!
  var coloredMap = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
  
  for _ in 0..<n {
    map.append(readLine()!.split(separator: " ").map { Int($0)! })
  }
  
  func bfs(square: Square, id: Int) {
    let q = Queue<Square>()
    q.enqueue(item: square)
    coloredMap[square.x][square.y] = id
    
    while !q.isEmpty() {
      let sq = q.dequeue()!
      let x = sq.x
      let y = sq.y
      for i in 0..<4 {
        let nx = x + dx[i]
        let ny = y + dy[i]
        // check the bounds
        if nx >= 0 && nx < n && ny >= 0 && ny < n {
          if (map[nx][ny] == 1 && coloredMap[nx][ny] == 0) { // check if there's a house
            q.enqueue(item: Square(x: nx, y: ny))
            coloredMap[nx][ny] = id
          }
        }
      }
    }
  }
  
  var id = 0
  for x in 0..<n {
    for y in 0..<n {
      if map[x][y] == 1 && coloredMap[x][y] == 0 {
        id += 1
        bfs(square: Square(x: x, y: y), id: id)
      }
    }
  }
  
  //start from island #1 and build bridge to remaining islands from each node of island #1
  for x in 0..<n {
    for y in 0..<n {
      if coloredMap[x][y] == 0 {
        //build bridge...
        
      
      }
    }
  }

}
