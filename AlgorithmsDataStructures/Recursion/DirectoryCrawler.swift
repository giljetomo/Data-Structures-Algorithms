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
var fileCount = 0
var directoryCount = 0

func crawler() {
  let filePath = "/Users/macbookpro/Documents/Cornerstone/ConnectionToSQL"
  crawlerHelper(filePath: filePath, soFar: "")
  print("Directories: \(directoryCount), Files: \(fileCount)")
}

func crawlerHelper(filePath: String, fileName: String = "", soFar: String, indent: String = "") {
  guard let files = try? fileManager.contentsOfDirectory(atPath: filePath) else {
    let prevFilePath = String(filePath[...filePath.index(before: filePath.lastIndex(of: "/")!)])
    let files = try! fileManager.contentsOfDirectory(atPath: prevFilePath)
    var symbol = ""
    symbol = files.last == fileName ? Symbol.lastFile : Symbol.mainDirectory
    fileCount += 1
    print(soFar + indent + symbol + " " + fileName)
    return
  }
  
  for i in 0..<files.count {
    var symbol = ""
    if i == 0 {
      let fileName = String(filePath[filePath.index(after: filePath.lastIndex(of: "/")!)...])
      symbol = files.last == files[0] ? Symbol.lastFile : Symbol.mainDirectory
      directoryCount += 1
      print(soFar + indent + symbol + " " + fileName)
    }
    symbol = Symbol.pipe
    
    let file = files[i]
    crawlerHelper(filePath: filePath + "/" + file,
                  fileName: file,
                  soFar: soFar + indent + symbol,
                  indent: indent + " ")
  }
}
