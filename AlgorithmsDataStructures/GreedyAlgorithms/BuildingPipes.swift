//
//  BuildingPipes.swift
//  AlgorithmsDataStructures
//
//  Created by Gil Jetomo on 2021-04-14.
//

import Foundation

/// The UF struct represents a union-find (disjoint sets) data structure
/// It supports **union** and **find** operations, along with methods for
/// determining whether two nodes are in the same component and the total
/// number of components.
/// - This implementation uses weighted quick union (by size or rank) with
/// full path compression.
/// - Initializing a data structure with **n** nodes takes linear time.
/// - Afterwards, **union**, **find**, and **connected** take logarithmic time
/// (in the worst case) and **count** takes constant time.
/// - Moreover, the amortized time per **union**, **find**, and **connected** operation
/// has inverse Ackermann complexity (which is practically < 5 for 2^(2^(2^(2^16))) - undefined number).
public struct UF {
  /// parent[i] = parent of i
  private var parent: [Int]
  /// size[i] = number of nodes in tree rooted at i
  private var size: [Int]
  /// number of components
  private(set) var count: Int
  
  /// Initializes an empty union-find data structure with **n** elements
  /// **0** through **n-1**.
  /// Initially, each elements is in its own set.
  /// - Parameter n: the number of elements
  public init(_ n: Int) {
    self.count = n
    self.size = [Int](repeating: 1, count: n)
    self.parent = [Int](repeating: 0, count: n)
    for i in 0..<n {
      self.parent[i] = i
    }
  }
  
  /// Returns the canonical element(root) of the set containing element `p`.
  /// - Parameter p: an element
  /// - Returns: the canonical element of the set containing `p`
  public mutating func find(_ p: Int) -> Int {
    try! validate(p)
    var root = p
    while root != parent[root] { // find the root
      root = parent[root]
    }
    var p = p
    while p != root {
      let newp = parent[p]
      parent[p] = root  // path compression
      p = newp
    }
    return root
  }
  
  /// Returns `true` if the two elements are in the same set.
  /// - Parameters:
  ///   - p: one elememt
  ///   - q: the other element
  /// - Returns: `true` if `p` and `q` are in the same set; `false` otherwise
  public mutating func connected(_ p: Int, _ q: Int) -> Bool {
    return find(p) == find(q)
  }
  
  /// Merges the set containing element `p` with the set containing
  /// element `q`
  /// - Parameters:
  ///   - p: one element
  ///   - q: the other element
  public mutating func union(_ p: Int, _ q: Int) {
    let rootP = find(p)
    let rootQ = find(q)
    guard rootP != rootQ else { return } // already connected
    
    // make smaller root point to larger one
    if size[rootP] < size[rootQ] {
      parent[rootP] = rootQ
      size[rootQ] += size[rootP]
    } else {
      parent[rootQ] = rootP
      size[rootP] += size[rootQ]
    }
    count -= 1
  }
  
  private func validate(_ p: Int) throws {
    let n = parent.count
    guard p >= 0 && p < n else {
      throw RuntimeError.illegalArgumentError("index \(p) is not between 0 and \(n - 1)")
    }
  }
}

enum RuntimeError: Error {
    case illegalArgumentError(String)
}

func numOfDays() -> Int {
  let input = readLine()!.split(separator: " ").map { Int($0)! }
  let buildings = input[0]
  let pipes = input[1]
  let enhancer = input[2]
  var allEdges = [(u: Int, v: Int, w: Int, isActive: Bool)]()
  var mstEdges = [(u: Int, v: Int, w: Int, isActive: Bool)]()
  
  for i in 1...pipes {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    let u = line[0]
    let v = line[1]
    let w = line[2]
    allEdges.append((u: u, v: v, w: w, isActive: i < buildings))
  }
  
  allEdges.sort { $0.w < $1.w }

  var days = 0
  var uf = UF(buildings + 1)
  for edge in allEdges {
    if uf.connected(edge.u, edge.v) { continue }
    uf.union(edge.u, edge.v)
    mstEdges.append((u: edge.u, v: edge.v, w: edge.w, isActive: edge.isActive))
    if !edge.isActive { days += 1 }
  }
  return enhancer == 0 ? days : applyEnhancer(days)
}

func applyEnhancer(_ days: Int) -> Int {
  //pending implementation
  return days
}

numOfDays()
