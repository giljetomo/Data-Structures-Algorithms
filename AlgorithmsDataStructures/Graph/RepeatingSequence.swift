//
//  RepeatingSequence.swift
//  SwiftAGDS
//
//  Created by Derrick Park on 7/23/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import Foundation

func RepeatingSequence() {
  
  func next(A: Int, P: Int) -> Int {
    return
      String(A)
        .compactMap { power(base: Int(String($0))!, exponent: P) }
        .reduce(0, +)
  }
  
  func length(A: Int, P: Int, seq: Int, check: inout [Int]) -> Int {
    if check[A] != 0 {
      return check[A] - 1
    }
    check[A] = seq
    let nx = next(A: A, P: P)
    return length(A: nx, P: P, seq: seq + 1, check: &check)
  }
  
  var check = [Int](repeating: 0, count: 1_000_000)
  let input = readLine()!.split(separator: " ").map { Int($0)! }
  let A = input[0]
  let P = input[1]
  print(length(A: A, P: P, seq: 1, check: &check))
}

//Repeating Sequence
//
//There’s a sequence defined as follows:
//D[1] = A
//D[N] = the sum of (each digit of D[N-1])P
//
//For example, A = 57 and P = 2 then
//D[1] = 57
//D[2] = 52 + 72 = 74
//D[3] = 72 + 42 = 65
//D[4] = 62 + 52 = 61
//D[5] = 62 + 12 = 37
//…
//
//So the sequence D is {57, 74, 65, 61, 37, 58, 89, 145, …, 16, 37, …  }. If you continue to search for such a sequence, you will find a repeating sequence.
//Write a program that counts the number of integers in the sequence that are not part of the repeating sequence. In the example above, the four numbers {57, 74, 65, 61} are left.
//
//Input Specification
//On the first line, A (1 <= A <= 9999) and P (1 <= P <= 5)
//
//Output Specification
//The number of integers that are not part of the repeating sequence.
//
//Sample Input 1
//57 2
//Sample Output 1
//4
