//
//  main.swift
//  Student Grades
//
//  Created by Ion Sebastian Rodriguez Lara on 20/03/23.
//

import Foundation

outerloop: while true { //The main loop that gets the user input to obtain the files for input and output
    var fileContent = "" //The content in the input file
    var outputFile = "" //The string with the URL of the output file
    var students: [Subject] = [] //The dynamic array for all the students information
    //Loop to get input file
    while true {
        print("Please enter the name of Input file:")
        if let input = readLine() { //Unwrap the input
            //Unwrap the contents of the file, replacing the \ found in the url to avoid an error
            if let content = try? String(contentsOfFile: input.replacingOccurrences(of: "\\", with: "")) {
                fileContent = content //Save the unwrapped contents
                break
            } else { //In case the file's contents cannot be unwrapped
                print("Invalid file. Please re-enter:")
            }
        } else { //In case the user's input cannot be unwrapped
            print("Invalid input. Please re-enter:")
            continue
        }
    }
    //Loop to get output file
    while true {
        print("Please enter the name of the Output file:")
        if let output = readLine() { //Unwrap the input
            //Make sure the file exists, replacing the \ found in the url to avoid an error
            if FileManager.default.fileExists(atPath: output.replacingOccurrences(of: "\\", with: "")) {
                outputFile = output.replacingOccurrences(of: "\\", with: "") //Save the url as a string
                break
            } else { //In case that file doesn't exist
                print("File does not exist. Please re-enter:")
                continue
            }
        } else { //In case that user's input cannot be unwrapped
            print("Invalid output. Please re-enter:")
            continue
        }
    }
    //After getting the Input and Output files ---------------------------
    var lines = fileContent.components(separatedBy: "\n") //Get an array composed of every line in the Input file
    if let numOfStudents = Int(lines[0]) { //Get the number of students from the first line of the Input File
        lines.remove(at: 0) //Remove from array the line with number of students
        for _ in 0..<numOfStudents { //Do this for as many students as indicated
            let names = lines[0].components(separatedBy: ", ") //Get an array with the names
            
            lines.remove(at: 0) //Remove the line we just used
            
            let gradeString = lines[0].components(separatedBy: " ") //Get an array with each word or grade in the next line
            var grades : [Double] = [] //Create an array to store the grades
            for j in 1..<gradeString.count { //Populate the grades array
                if let grade = Double(gradeString[j]) {
                    grades.append(grade)
                }
            }
            //Check what subject the student belongs to, and create the respective student object with the saved values
            if lines[0].contains("English") { //For English
                students.append(English(firstName: names[1], lastName: names[0], paperGrade: grades[0], midtermGrade: grades[1], finalGrade: grades[2]))
            } else if lines[0].contains("History") { //For History
                students.append(History(firstName: names[1], lastName: names[0], attendanceGrade: grades[0], projectGrade: grades[1], midtermGrade: grades[2], finalGrade: grades[3]))
            } else { //For Math
                students.append(Math(firstName: names[1], lastName: names[0], quizzesGrades: [grades[0], grades[1], grades[2], grades[3], grades[4]], testsGrades: [grades[5], grades[6]], finalGrade: grades[7]))
            }
            lines.remove(at: 0) //Remove the line with grades and subject to continue with next student
        }
        //We start creating the string we will add to the file -------------------------------------------------------------------------------
        //The header of each subject
        let header = "Student                                   Final   Final   Letter\nName                                      Exam    Avg     Grade\n----------------------------------------------------------------\n"
        //The string where we will save the formatted information
        var newContent = ""
        //An array to save how many students got each letter grade
        var gradeDistribution = [0,0,0,0,0] //0 = A, 1 = B, 2 = C ...
        //Add the information at the top
        newContent.append("Student Grade Summary\n")
        newContent.append("---------------------\n\n") //Division line
        //English section
        newContent.append("ENGLISH CLASS\n\n")
        newContent.append(header)
        students.sort(by: <) //We sort the students alphabetically
        //Add the English class content
        for student in students { //These for loops could have been optimized by saving strings for each subject, but it's 2AM and I'm tired, sorry.
            if student.subject == .English { //Add the description of the student if they belong to the English class
                newContent.append("\(student.description)\n")
            }
            //For each student we get their letter grade in this first loop.
            let tempLetter = student.getLetter()
            switch tempLetter { //Deppending the letter grade we add to their respective counters
            case "A":
                gradeDistribution[0] += 1
            case "B":
                gradeDistribution[1] += 1
            case "C":
                gradeDistribution[2] += 1
            case "D":
                gradeDistribution[3] += 1
            default:
                gradeDistribution[4] += 1
            }
        }
        newContent.append("\n\n") //Space after section
        //History Section
        newContent.append("HISTORY CLASS\n\n")
        newContent.append(header)
        //Add the History class content
        for student in students {
            if student.subject == .History { //Add the description of the student if they belong to the History class
                newContent.append("\(student.description)\n")
            }
        }
        newContent.append("\n\n") //Space after section
        newContent.append("MATH CLASS\n\n")
        newContent.append(header)
        //Add the Math class content
        for student in students {
            if student.subject == .Math { //Add the description of the student if they belong to the Math class
                newContent.append("\(student.description)\n")
            }
        }
        newContent.append("\n\n") //Space after section
        //Section for the count of the different letter grades
        newContent.append("OVERALL GRADE DISTRIBUTION\n\n")
        newContent.append("A:   \(gradeDistribution[0])\n")
        newContent.append("B:   \(gradeDistribution[1])\n")
        newContent.append("C:   \(gradeDistribution[2])\n")
        newContent.append("D:   \(gradeDistribution[3])\n")
        newContent.append("F:   \(gradeDistribution[4])\n")
        
        //After getting all the information formatted into a string we write it to the file
        do {
            try newContent.write(to: URL(fileURLWithPath: outputFile), atomically: false, encoding: .utf8) //We try to write the content into the file
            print("Succesfully wrote into \(outputFile)") //Succes message
            break
        } catch {
            print(error.localizedDescription) //Error message
            break
        }
    } else { //If file's first line is not a number this error will show and prompt the user to input files again
        print("Error. File does not meet requirements. Please re-enter:")
        continue
    }
}
//I have this here for the demonstration
///Users/ionsebastianrodriguezlara/Documents/Homework/Grades-Assignment/Student\ Grades/Student\ Grades/sample.in
///Users/ionsebastianrodriguezlara/Documents/Homework/Grades-Assignment/done.out
