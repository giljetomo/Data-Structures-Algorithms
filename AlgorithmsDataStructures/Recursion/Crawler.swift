//
//  main.swift
//  ctree
//
//  Created by Derrick Park on 2019-03-07.
//  Copyright © 2019 Derrick Park. All rights reserved.
//
import Foundation

//let fileManager = FileManager.default
var dirCount = 0
//var fileCount = 0
func isDirectory(atPath path: URL) -> Bool {
  var isDirectory: ObjCBool = false
  if fileManager.fileExists(atPath: path.path, isDirectory: &isDirectory) {
    if isDirectory.boolValue {
      return true
    }
  }
  return false // not a dir or file does not exist
}
func crawl(path: String, prefix: String, dirCount: inout Int, fileCount: inout Int) {
  guard let contents = try? fileManager.contentsOfDirectory(at: URL(string: path)!, includingPropertiesForKeys: nil, options: .skipsSubdirectoryDescendants) else { return }
  for i in 0..<contents.count {
    // print current file or dir
    let currentContent = (i < contents.count - 1) ? (prefix + "├─ ") : (prefix + "└─ ")
    print(currentContent, terminator: "")
    let contentStr = contents[i].path
    let indexOfLastSlash = contentStr.lastIndex(of: "/")!
    print(contentStr[contentStr.index(after: indexOfLastSlash)...])
    if isDirectory(atPath: contents[i]) {
      // next prefix
      let nextPrefix = (i < contents.count - 1) ? (prefix + "│    ") : (prefix + "    ")
      dirCount += 1
      crawl(path: contents[i].path, prefix: nextPrefix, dirCount: &dirCount, fileCount: &fileCount)
    } else {
      fileCount += 1
    }
  }
}
//crawl(path: fileManager.currentDirectoryPath, prefix: "", dirCount: &dirCount, fileCount: &fileCount)
//print("\n\(dirCount) directories, \(fileCount) files")
