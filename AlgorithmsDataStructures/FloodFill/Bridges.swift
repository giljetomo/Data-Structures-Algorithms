//
//  Bridges.swift
//  SwiftAGDS
//
//  Created by Derrick Park on 7/28/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import Foundation

func Bridges() {
  let dx = [0, 0, 1, -1]
  let dy = [1, -1, 0, 0]
  
  let n = Int(readLine()!)!
  var group = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
  var distance = [[Int]](repeating: [Int](repeating: -1, count: n), count: n)
  var inputMap = [[Int]]()
  
  for _ in 0..<n {
    inputMap.append(readLine()!.split(separator: " ").map { Int($0)! })
  }
  
  /// Labeling groups
  var count = 0
  for i in 0..<n {
    for j in 0..<n {
      if inputMap[i][j] == 1 && group[i][j] == 0 {
        count += 1
        group[i][j] = count
        let q = Queue<(Int, Int)>()
        q.enqueue(item: (i, j))
        while !q.isEmpty() {
          let (x, y) = q.dequeue()!
          for k in 0..<4 {
            let nx = x + dx[k]
            let ny = y + dy[k]
            if nx >= 0 && nx < n && ny >= 0 && ny < n {
              if inputMap[nx][ny] == 1 && group[nx][ny] == 0 {
                group[nx][ny] = count
                q.enqueue(item: (nx, ny))
              }
            }
          }
        }
      }
    }
  }
  
  /// Marking distance
  let q = Queue<(Int, Int)>()
  for i in 0..<n {
    for j in 0..<n {
      if inputMap[i][j] == 1 {
        q.enqueue(item: (i, j))
        distance[i][j] = 0
      }
    }
  }
  
  /// Land extension
  while !q.isEmpty() {
    let (x, y) = q.dequeue()!
    for k in 0..<4 {
      let nx = x + dx[k]
      let ny = y + dy[k]
      if nx >= 0 && nx < n && ny >= 0 && ny < n {
        if distance[nx][ny] == -1 {
          distance[nx][ny] = distance[x][y] + 1
          group[nx][ny] = group[x][y]
          q.enqueue(item: (nx, ny))
        }
      }
    }
  }
  
  /// Get the minimum
  var answer = Int.max
  for i in 0..<n {
    for j in 0..<n {
      for k in 0..<4 {
        let x = i + dx[k]
        let y = j + dy[k]
        if x >= 0 && x < n && y >= 0 && y < n {
          if group[i][j] != group[x][y] {
            answer = min(answer, distance[i][j] + distance[x][y])
          }
        }
      }
    }
  }
  
  print(answer)
}

//There’s a country made up of several islands. The president of this country promised people that he would build bridges to connect the islands. However, after he got re-elected he started thinking that it would be a waste to build all the bridges. One day he came to the conclusion that he can get away by building only one bridge (shortest). This country can be represented by N x N grid as below (There are 3 islands). Gray square = land, White square = ocean
//
//
//In order to build the shortest bridge, here’s one way.
//
//(There are several different ways to build a bridge that has a length of 3)
//Given a N x N grid map, write a program to get the length of the shortest bridge.
//
//Input Specification
//First line: N (size of the map, 1 <= N <= 100)
//Next N lines of data.
//
//Output Specification
//The shortest length
//
//
//Sample Input1
//10
//1 1 1 0 0 0 0 1 1 1
//1 1 1 1 0 0 0 0 1 1
//1 0 1 1 0 0 0 0 1 1
//0 0 1 1 1 0 0 0 0 1
//0 0 0 1 0 0 0 0 0 1
//0 0 0 0 0 0 0 0 0 1
//0 0 0 0 0 0 0 0 0 0
//0 0 0 0 1 1 0 0 0 0
//0 0 0 0 1 1 1 0 0 0
//0 0 0 0 0 0 0 0 0 0
//Sample Output1
//3
//
//Sample Input2
//10
//1 1 1 0 0 0 0 1 1 1
//1 1 1 1 0 0 0 0 1 1
//1 0 1 1 0 0 0 0 1 1
//0 0 1 1 1 0 0 0 0 1
//0 0 0 1 0 0 0 0 0 1
//0 0 0 0 0 0 1 0 0 1
//0 0 0 0 0 0 1 0 0 0
//0 0 0 0 1 1 1 0 0 0
//0 0 0 0 1 1 1 0 0 0
//0 0 0 0 0 0 0 0 0 0
//Sample Output2
//2
