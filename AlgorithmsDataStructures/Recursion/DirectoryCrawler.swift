//
//  DirectoryCrawler.swift
//  AlgorithmsDataStructures
//
//  Created by Gil Jetomo on 2021-03-12.
//

import Foundation

struct Symbol {
  static let mainDirectory = "├─"
  static let pipe = "│"
  static let lastFile = "└─"
}

let fileManager = FileManager.default

func crawler() {
  let filePath = "/Users/macbookpro/Documents/Cornerstone/ConnectionToSQL"
  crawlerHelper(filePath: filePath, soFar: "")
}

func crawlerHelper(filePath: String, fileName: String = "", soFar: String, indent: String = "") {
  guard let files = try? fileManager.contentsOfDirectory(atPath: filePath), files.count > 0 else {
    let prevFilePath = String(filePath[...filePath.index(before: filePath.lastIndex(of: "/")!)])
    let files = try! fileManager.contentsOfDirectory(atPath: prevFilePath)
    var symbol = ""
    if files.last == fileName {
      (symbol = Symbol.lastFile)
    } else {
      (symbol = Symbol.mainDirectory)
    }
    print(soFar + indent + symbol + " " + fileName)
    return
  }
  
  for i in 0..<files.count {
    if i == 0 {
      let file = String(filePath[filePath.index(after: filePath.lastIndex(of: "/")!)...])
      let prevFilePath = String(filePath[...filePath.index(before: filePath.lastIndex(of: "/")!)])
      //      var isDir : ObjCBool = false
      var symbol = ""
      //      if fileManager.fileExists(atPath: prevFilePath, isDirectory: &isDir) {
      let files = try! fileManager.contentsOfDirectory(atPath: prevFilePath)
      if files.last == file {
        (symbol = Symbol.lastFile)
      } else {
        (symbol = Symbol.mainDirectory)
      }
      //      }
      print(soFar + indent + symbol + " " + file)
    }
    let file = files[i]
    crawlerHelper(filePath: filePath + "/" + file, fileName: file, soFar: Symbol.pipe, indent: indent + "   ")
  }
}
