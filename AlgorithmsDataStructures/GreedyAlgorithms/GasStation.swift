//
//  GasStation.swift
//  AlgorithmsDataStructures
//
//  Created by Gil Jetomo on 2021-04-08.
//

import Foundation

func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
  
  var start = 0
  var pivot = 0
  var tank = 0
  
  while true {
    tank += gas[pivot]
    tank -= cost[pivot]
    
    if tank >= 0 {
      pivot = gas.count - 1 == pivot ? 0 : pivot + 1
      if pivot == start { return start }
    } else {
      start = gas.count - 1 == start ? -1 : start + 1
      if start == -1 { return -1 }
      else {
        tank = 0
        pivot = start
      }
    }
  }
}
