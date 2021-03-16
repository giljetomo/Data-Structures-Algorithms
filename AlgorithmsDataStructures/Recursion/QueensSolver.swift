//
//  QueensSolver.swift
//  SwiftAGDS
//
//  Created by Derrick Park on 2019-03-13.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

import Foundation

/// Write a function solveQueens that accepts a Board as a parameter
/// and tries to place 8 queens on it safely.
///
/// - Your method should stop exploring if it finds a solution
/// - You are allowed to change the function header (args or return type)
/// - Your total recursive calls should not exceed 120 times.

var count = 0
var p = 0
func solveQueens(board: inout Board) {
  var b = board
  solveQueensHelper(board: &b)
  print("Total recursive calls: \(count)")
  print("Possible ways: \(p)")
}

func solveQueensHelper(board: inout Board, col: Int = 0) {
  count += 1
  if col == board.size {
    p += 1
    guard p == 1 else {
      print(board)
      return
    }
    print("First possible way with \(count) recursive calls")
    print(board)
  }
  //try to place the queen on each row per column
  for i in 0..<board.size {
    if board.isSafe(row: i, col: col) {
      //choose
      board.place(row: i, col: col)
      //explore
      solveQueensHelper(board: &board, col: col + 1)
      //un-choose
      board.remove(row: i, col: col)
    }
  }
}
