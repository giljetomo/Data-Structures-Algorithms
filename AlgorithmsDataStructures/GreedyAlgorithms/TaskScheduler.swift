//
//  TaskScheduler.swift
//  SwiftAGDS
//
//  Created by Derrick Park on 7/29/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
// https://leetcode.com/problems/task-scheduler/

import Foundation

func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
  var frequencies = [Int](repeating: 0, count: 26)
  var maxCount = 0
  var maxFreq = 0
  
  for task in tasks {
    let i = Int(task.asciiValue!) - 65
    frequencies[i] += 1
  }
  
  for freq in frequencies {
    if freq == 0 { continue }
    if maxFreq < freq {
      maxFreq = freq
      maxCount = 1
    } else if maxFreq == freq {
      maxCount += 1
    }
  }
  
  let placeHolderLength = (n + 1) * (maxFreq - 1) + maxCount
  return tasks.count > placeHolderLength ? tasks.count : placeHolderLength
}
