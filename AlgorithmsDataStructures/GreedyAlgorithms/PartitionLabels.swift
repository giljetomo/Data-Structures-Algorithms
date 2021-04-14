//
//  PartitionLabels.swift
//  SwiftAGDS
//
//  Created by Derrick Park on 8/14/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
// https://leetcode.com/problems/partition-labels/

import Foundation

/// Leetcode 763
func partitionLabels(_ S: String) -> [Int] {
  // get the rightmost index of each char
  var map = Dictionary<Character, Int>()
  for (i, ch) in S.enumerated() {
    map[ch] = i
  }
  var res = [Int]()
  var (start, end) = (0, 0)
  for (i, ch) in S.enumerated() {
    end = map[ch]! > end ? map[ch]! : end
    if i == end {
      res.append(end - start + 1)
      start = i + 1
    }
  }
  return res
}
