//
//  CyclicPermutation.swift
//  SwiftAGDS
//
//  Created by Derrick Park on 7/23/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import Foundation

func CyclicPermutation() {
  
  /// DFS
  func dfs(start: Int, check: inout [Bool], nodes: inout [Int]) {
    if check[start] {
      return
    }
    check[start] = true
    dfs(start: nodes[start], check: &check, nodes: &nodes)
  }
  
  var tests = Int(readLine()!)!
  while tests > 0 {
    let n = Int(readLine()!)!
    var nodes = readLine()!.split(separator: " ").map { Int($0)! }
    nodes.insert(0, at: 0)
    var check = [Bool](repeating: false, count: n + 1)
    
    var count = 0
    for v in 1...n {
      if check[v] == false {
        dfs(start: v, check: &check, nodes: &nodes)
        count += 1
      }
    }
    print(count)
    tests -= 1
  }
}

//There are several ways to represent a permutation of N integers from 1 to N. For example, a permutation of 8 elements (3, 2, 7, 8, 1, 4, 5, 6) can be represented as
// 
//Alternatively, it can be represented as a directed graph below.
//As shown in the graph above, there are three cycles. (permutation cycles).
//Given a set of N integer elements, write a program that finds the number of cycles.
//
//Input Specification
//First line: the number of test cases T
//In the first row of each test case, the size N of the permutation (2 <= N <= 1000) is given. The second row of each test case will have a permutation of N integers. (space-separated)
//
//Output Specification
//For each test case, output the number of permutations cycles.
//
//Sample Input 1
//2
//8
//3 2 7 8 1 4 5 6
//10
//2 1 3 4 5 6 7 9 10 8
//Sample Output 1
//3
//7
