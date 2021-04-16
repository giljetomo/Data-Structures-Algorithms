//
//  GasStation.swift
//  SwiftAGDS
//
//  Created by Derrick Park on 7/30/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import Foundation

func canCompleteCircuitIntuitive(_ gas: [Int], _ cost: [Int]) -> Int {
  let numStations = gas.count
  var possibleStarts = [Int]()
  for i in 0..<numStations {
    if gas[i] >= cost[i] {
      possibleStarts.append(i)
    }
  }
  
  while !possibleStarts.isEmpty {
    var start = possibleStarts.remove(at: 0)
    var travelCount = numStations
    var fuel = 0
    while travelCount != 0 {
      let cost = cost[start]
      fuel += gas[start]
      if fuel < cost { break }
      fuel -= cost
      start = (start + 1) % numStations
      travelCount -= 1
    }
    
    if travelCount == 0 {
      return start
    }
  }
  
  return -1
}

func canCompleteCircuit2(_ gas: [Int], _ cost: [Int]) -> Int {
  /// [].enumerated() - array of (index, value) tuples
  let gas = gas.enumerated().map { $1 - cost[$0] }
  let numStations = gas.count
  var i = 0
  var fuelSoFar = 0
  var start = 0
  while i < gas.count * 2 - 1 {
    fuelSoFar += gas[i % numStations]
    if fuelSoFar < 0 {
      start = i + 1
      if start >= numStations {
        return -1
      }
      fuelSoFar = 0
    }
    i += 1
  }

  return start
}
