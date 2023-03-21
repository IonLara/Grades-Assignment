//
//  main.swift
//  Student Grades
//
//  Created by Ion Sebastian Rodriguez Lara on 20/03/23.
//

import Foundation

outerloop: while true {
    var fileContent = ""
    var outputFile = ""
    while true {
        print("Please enter the name of Input file:")
        if let input = readLine() {
            if let content = try? String(contentsOfFile: input.replacingOccurrences(of: "\\", with: "")) {
                fileContent = content
                break
            } else {
                print("Invalid file. Please re-enter:")
            }
        } else {
            print("Invalid input. Please re-enter:")
            continue
        }
    }
    while true {
        print("Please enter the name of the Output file:")
        if let output = readLine() {
            if FileManager.default.fileExists(atPath: output.replacingOccurrences(of: "\\", with: "")) {
                outputFile = output.replacingOccurrences(of: "\\", with: "")
                break
            } else {
                print("File does not exist. Please re-enter:")
                continue
            }
        } else {
            "Invalid output. Please re-enter:"
            continue
        }
    }
    
    
}
///Users/ionsebastianrodriguezlara/Documents/Homework/Grades-Assignment/Student\ Grades/Student\ Grades/sample.in
///Users/ionsebastianrodriguezlara/Documents/Homework/Grades-Assignment/Student\ Grades/Student\ Grades/sample.out

//// How to read a file?
//let filename = "sample.in"
//if let contents = try? String(contentsOfFile: "/Users/park/Desktop/Assignment5/Assignment5/\(filename)") {
//  print(contents)
//}
//
//// How to write into a file?
//let outputFilename = "sample.out"
//let outputString = "Hello, World!"
//if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
//
//  let fileURL = dir.appending(path: outputFilename)
//  do {
//    try outputString.write(to: fileURL, atomically: false, encoding: .utf8)
//    print("Sucessfully wrote into \(fileURL.absoluteString)")
//  } catch {
//    print(error.localizedDescription)
//  }
//}

