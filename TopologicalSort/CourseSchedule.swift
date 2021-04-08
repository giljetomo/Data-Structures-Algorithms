//
//  CourseSchedule.swift
//  AlgorithmsDataStructures
//
//  Created by Gil Jetomo on 2021-04-07.
//

import Foundation

func canFinishCourses(numCourses: Int, prerequisites: [[Int]]) -> Bool {
  //create an array to store the in-degree counts of each vertex
  var indegree = [Int](repeating: 0, count: numCourses)
  var adjList = [[Int]](repeating: [], count: numCourses)
  
///alternative implementation without using adjacency list
//populate the in-degree array
//  for row in prerequisites {
//    indegree[row[0]] += 1
//  }
  
  //populate the adjacency list and in-degree array
  for row in prerequisites {
    let u = row[0]
    let v = row[1]

    adjList[v].append(u)
    indegree[u] += 1
  }
  
  //create a queue and initially enqueue it with all vertex with in-degree count of 0.
  let q = Queue<Int>()
  //only the vertex with 0 in-degree will be enqueued
  for i in 0..<indegree.count where indegree[i] == 0 {
    q.enqueue(item: i)
  }
  //if the queue is empty after the initial processing, that means the graph has at least one cycle
  guard !q.isEmpty() else { return false }
  
  while !q.isEmpty() {
    let u = q.dequeue()!
    for v in adjList[u] {
      indegree[v] -= 1
      if indegree[v] == 0 {
        q.enqueue(item: v)
      }
    }
  }
  
///alternative implementation
//  while !q.isEmpty() {
//    let u = q.dequeue()!
//    for row in prerequisites {
//      for course in row where course == u && indegree[row[0]] > 0 {
//        indegree[row[0]] -= 1
//        indegree[row[0]] == 0 ? q.enqueue(item: row[0]) : nil
//      }
//    }
//  }
  
  //if all elements of the in-degree array are not reduced to 0, then there is a cycle
  return indegree.filter { $0 > 0 }.count == 0
}