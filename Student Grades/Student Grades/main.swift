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
    var students: [Subject] = []
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
            print("Invalid output. Please re-enter:")
            continue
        }
    }
    var lines = fileContent.components(separatedBy: "\n")
    if let numOfStudents = Int(lines[0]) {
        lines.remove(at: 0)
        for _ in 0..<numOfStudents {
            var names = lines[0].components(separatedBy: ", ")
            
            lines.remove(at: 0)
            
            let gradeString = lines[0].components(separatedBy: " ")
            var grades : [Double] = []
            for j in 1..<gradeString.count {
                if let grade = Double(gradeString[j]) {
                    grades.append(grade)
                }
            }
            
            if lines[0].contains("English") {
                students.append(English(firstName: names[1], lastName: names[0], paperGrade: grades[0], midtermGrade: grades[1], finalGrade: grades[2]))
            } else if lines[0].contains("History") {
                students.append(History(firstName: names[1], lastName: names[0], attendanceGrade: grades[0], projectGrade: grades[1], midtermGrade: grades[2], finalGrade: grades[3]))
            } else { //Math
                students.append(Math(firstName: names[1], lastName: names[0], quizzesGrades: [grades[0], grades[1], grades[2], grades[3], grades[4]], testsGrades: [grades[5], grades[6]], finalGrade: grades[7]))
            }
            lines.remove(at: 0)
        }
        let header = "Student                                   Final   Final   Letter\nName                                      Exam    Avg     Grade\n----------------------------------------------------------------\n"
        var newContent = ""
        var gradeDistribution = [0,0,0,0,0]
        newContent.append("Student Grade Summary\n")
        newContent.append("---------------------\n\n")
        newContent.append("ENGLISH CLASS\n\n")
        newContent.append(header)
        //Print the English class content
        
        newContent.append("\n\n")
        newContent.append("HISTORY CLASS\n\n")
        newContent.append(header)
        //Print the History class content
        
        newContent.append("\n\n")
        newContent.append("MATH CLASS\n\n")
        newContent.append(header)
        //Print the Math class content
        
        newContent.append("\n\n")
        newContent.append("OVERALL GRADE DISTRIBUTION\n\n")
        newContent.append("A:   \(gradeDistribution[0])\n")
        newContent.append("B:   \(gradeDistribution[1])\n")
        newContent.append("C:   \(gradeDistribution[2])\n")
        newContent.append("D:   \(gradeDistribution[3])\n")
        newContent.append("F:   \(gradeDistribution[4])\n")
        print(newContent)
    } else {
        print("Error. File does not meet requirements. Please re-enter:")
        continue
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

