//
//  TomatoFarm.swift
//  SwiftAGDS
//
//  Created by Derrick Park on 7/28/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import Foundation

func TomatoFarm() {
  
  let dx = [1, -1, 0, 0]
  let dy = [0, 0, 1, -1]
  
  let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
  let width = firstLine[0]
  let height = firstLine[1]
  
  var days = [[Int]](repeating: [Int](repeating: -1, count: width), count: height)
  var grid = [[Int]]()
  
  for _ in 0..<height {
    grid.append(readLine()!.split(separator: " ").map { Int($0)! })
  }
  
  let q = Queue<(x: Int, y: Int)>()
  for r in 0..<height {
    for c in 0..<width {
      if grid[r][c] == 1 {
        q.enqueue(item: (x: c, y: r))
        days[r][c] = 0
      }
    }
  }
  
  while !q.isEmpty() {
    let first = q.dequeue()!
    let x = first.x
    let y = first.y
    for i in 0..<4 {
      let nx = x + dx[i]
      let ny = y + dy[i]
      if nx >= 0 && nx < width && ny >= 0 && ny < height {
        if grid[nx][ny] == 0 && days[nx][ny] == -1 {
          days[nx][ny] = days[x][y] + 1
          q.enqueue(item: (x: nx, y: ny))
        }
      }
    }
  }
  
  var answer = 0
  for r in 0..<height {
    for c in 0..<width {
      if grid[r][c] == 0 && days[r][c] == -1 {
        answer = -1
        print(answer)
        return
      }
      if answer < days[r][c] {
        answer = days[r][c]
      }
    }
  }
  
  print(answer)
}

//Tom has a large tomato farm back in Vietnam. His tomatoes are placed in a box as shown in the picture below.
//
//Some of the tomatoes stored in his warehouse are ripe, but some may still be green(unripe). Each day, unripe tomatoes adjacent to ripe tomatoes ripen under the influence of ripe tomatoes. (adjacent = left, right, front, back)
//Tom wants to know if the tomatoes stored in the warehouse are ready to be cooked in a few days.
//
//Given the size of the grid-shaped boxes and the information about ripe tomatoes and unripe tomatoes, write a program to calculate how many days it takes for all the tomatoes to ripen.
//
//Input Specification
//First line: M N (M: width, N: height where 2 <= M, N <= 1000)
//Next N lines: 0s and 1s where 0(unripe tomatoes), 1(ripe tomatoes), -1(no tomatoes)
//
//Output Specification
//The minimum days. (O if already ripe, -1 if there’s no way to get all ripe tomatoes)
//
//Sample Input1
//6 4
//0 0 0 0 0 0
//0 0 0 0 0 0
//0 0 0 0 0 0
//0 0 0 0 0 1
//Sample Output1
//8
//Sample Input2
//6 4
//0 -1 0 0 0 0
//-1 0 0 0 0 0
//0 0 0 0 0 0
//0 0 0 0 0 1
//Sample Output2
//-1
//Sample Input3
//6 4
//1 -1 0 0 0 0
//0 -1 0 0 0 0
//0 0 0 0 -1 0
//0 0 0 0 -1 1
//Sample Output3
//6
//Sample Input4
//5 5
//-1 1 0 0 0
//0 -1 -1 -1 0
//0 -1 -1 -1 0
//0 -1 -1 -1 0
//0 0 0 0 0
//Sample Output4
//14
//
//
//
//
//
//Sample Input5
//2 2
//1 -1
//-1 1
//Sample Output5
//0
