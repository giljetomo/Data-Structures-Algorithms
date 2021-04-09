//
//  TwoCityScheduling.swift
//  AlgorithmsDataStructures
//
//  Created by Macbook Pro on 2021-04-08.
//

import Foundation

func twoCitySchedCost(_ costs: [[Int]]) -> Int {
  
  var a = (0, 0)
  var sum = 0
  
  for cost in costs {
    if a.0 == a.1 || (a.1 + 1 == costs.count/2 && a.0 == 0) || (a.0 + 1 == costs.count/2 && a.1 == 0) {
      cost[0] < cost[1] ? (a.0 += 1) : (a.1 += 1)
      sum += min(cost[0], cost[1])
    } else if a.0 > a.1 {
      a.1 += 1
      sum += cost[1]
    } else if a.1 > a.0 {
      a.0 += 1
      sum += cost[0]
    }
  }
  
  return sum
}

