//
//  GasStation.swift
//  AlgorithmsDataStructures
//
//  Created by Gil Jetomo on 2021-04-08.
//

import Foundation

func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
  
  var start = 0
  var tank = 0
  var total = 0
  
  // O(n)
  for i in 0..<gas.count {
    tank += gas[i] - cost[i]
    if tank < 0 {
      start = i + 1
      tank = 0
    }
    total += gas[i] - cost[i]
  }
  
  return total >= 0 ? start : -1
  
  ///alternative implementation:  O(n^2)
  //  var pivot = 0
  //  while true {
  //    tank += gas[pivot] - cost[pivot]
  //
  //    if tank >= 0 {
  //      pivot = gas.count - 1 == pivot ? 0 : pivot + 1
  //      if pivot == start { return start }
  //    } else {
  //      start = gas.count - 1 == start ? -1 : start + 1
  //      if start == -1 { return -1 }
  //      else {
  //        tank = 0
  //        pivot = start
  //      }
  //    }
  //  }
}
