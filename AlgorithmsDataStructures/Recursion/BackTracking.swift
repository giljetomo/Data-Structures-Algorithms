//
//  BackTracking.swift
//  AlgorithmsDataStructures
//
//  Created by Derrick Park on 2021-03-11.
//

import Foundation

/// Write a function rollDiceSum similar to rollDice, but it also accepts a desired sum and prints only permutations that add up to exactly that sum.
/// - Parameters:
///   - dice: the number of dice
///   - desiredSum: desired sum
/// Example: rollDiceSum(dice: 2, sum: 5)
///        [1, 4], [2, 3], [3, 2], [4, 1] *you can print as arrays
func rollDiceSum(n: Int, desiredSum: Int) {
  var choices = [Int]()
  rollDiceSumHelper(n: n, desiredSum: desiredSum, soFar: 0, choices: &choices)
}

func rollDiceSumHelper(n: Int, desiredSum: Int, soFar: Int, choices: inout [Int]) {
  if n == 0 {
    if desiredSum == soFar {
      print(choices)
    }
  } else {
    for i in 1...6 {
      // choose i, and the remaining desired sum should be between 1 * (n-1) <=   <= 6 * (n-1)
      if soFar + i + (n - 1) * 1 <= desiredSum && desiredSum <= soFar + i + (n - 1) * 6 {
        choices.append(i)
        rollDiceSumHelper(n: n - 1, desiredSum: desiredSum, soFar: soFar + i, choices: &choices)
        choices.removeLast()
      }
    }
  }
}
