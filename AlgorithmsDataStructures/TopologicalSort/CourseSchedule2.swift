//
//  CourseSchedule2.swift
//  SwiftAGDS
//
//  Created by Derrick Park on 7/31/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import Foundation

func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
  var adj = [[Int]](repeating: [Int](), count: numCourses)
  var indegrees = [Int](repeating: 0, count: numCourses)
  for edge in prerequisites {
    indegrees[edge[0]] += 1
    adj[edge[1]].append(edge[0])
  }
  
  var startingVertices = [Int]()
  for v in 0..<numCourses {
    if indegrees[v] == 0 {
      startingVertices.append(v)
    }
  }
  
  var results = [Int]()
  var dfs: ((Int) -> Void)!
  dfs = { (u) in
    results.append(u)
    for v in adj[u] {
      indegrees[v] -= 1
      if indegrees[v] == 0 {
        dfs(v)
      }
    }
  }
  
  for v in startingVertices {
    dfs(v)
  }
  
  return results.count == numCourses ? results : []
}
