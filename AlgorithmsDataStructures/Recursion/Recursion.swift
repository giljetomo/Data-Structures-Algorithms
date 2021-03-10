//
//  Recursion.swift
//  AlgorithmsDataStructures
//
//  Created by Macbook Pro on 2021-03-09.
//

import Foundation

// 1. power(base, exponent) -> base^exponent
// Assume exponent >= 0
func power(base: Int, exponent: Int) -> Int {
  // base case
  if exponent == 0 {
    return 1
  }
  // recursive case
  return base * power(base: base, exponent: exponent - 1)
}

// 2. isPalindrome(word) : checks if a word is a palindrome
func isPalindrome(_ word: String) -> Bool {
  // base case
  if word.count <= 1 { return true }
  // recursive case
  if let first = word.first, let last = word.last, first == last {
    return isPalindrome(word[1, word.count - 1])
  }
  return false
}

// 3. printBinary(n) : prints binary form of given int n
func printBinary(_ n: Int) {
  if n < 0 {
    print("-", terminator: "") // print without newline
    printBinary(-n)
    print()
    return
  }
  // base case
  if n < 2 {
    print(n)
    return // stop
  }
  printBinary(n / 2)
  print(n % 2, terminator: "")
}

/// reverseLines
/// - print all lines in reverse order (recursively) from a text file
/// - Parameter line: line number starting from 0

func reverseLines(_ line: Int) {
  let contents = try! String(contentsOfFile: "/Users/macbookpro/Documents/Cornerstone/AlgorithmsDataStructures/AlgorithmsDataStructures/Recursion/provinces.txt", encoding: .utf8)
  let lines = contents.split(separator: "\n")
  if line < lines.count {
    reverseLines(line + 1)
    print(lines[line])
  }
  
}

