//
//  Subject.swift
//  Student Grades
//
//  Created by Ion Sebastian Rodriguez Lara on 20/03/23.
//

import Foundation

class Subject: Comparable, CustomStringConvertible {
    private let firstName: String
    private let lastName: String
    let subject: Subjects //Not private because we need to access it to sort students in content of file (Cannot be private(set) because it's a constant)
    enum Subjects { //Enum for the subjects
        case English
        case Math
        case History
    }
    
    var description: String { //We conform to the CustomStringConvertible to make it easier to add the students information
        //All strings are padded to conform to desired format
        let names = String("\(firstName) \(lastName)").padding(toLength: 42, withPad: " ", startingAt: 0) //Get the names in order
        let grades = getGrade() //Get the grades of the student, Final exam grade and final grade
        let finalExam = String("\(Int(grades.finalExam))").padding(toLength: 8, withPad: " ", startingAt: 0) //Set the final exam grade as an int
        //Set final grade as a Double with only two decimal points
        let finalGrade = String(format: "%.2f",grades.finalGrade).padding(toLength: 8, withPad: " ", startingAt: 0)
        let letterGrade = getLetter() //Get the letter grade
        
        return "\(names)\(finalExam)\(finalGrade)\(letterGrade)" //Return a string with all the formatted needed information
    }
    
    init(firstName: String, lastName: String, subject: Subjects) { //Initializer for the class
        self.firstName = firstName
        self.lastName = lastName
        self.subject = subject
    }
    
    func getLetter() -> String { //Simple function to get the letter grade depending on the object's final grade
        switch getGrade().finalGrade {
        case 90...100:
            return "A"
        case 80..<90:
            return "B"
        case 70..<80:
            return "C"
        case 60..<70:
            return "D"
        default:
            return "F"
        }
    }
    
    func getGrade() -> (finalExam: Double, finalGrade: Double){ //Function to get the grades of the student (This is overriden in every sub-class)
        (100, 100)
    }
    
    static func <(lhs: Subject, rhs: Subject) -> Bool { //Conforming to comparable protocol to be able to sort in alphabetical order by last name
        lhs.lastName < rhs.lastName
    }
    static func ==(lhs: Subject, rhs: Subject) -> Bool { //Conforming to equatable protocol
        lhs.lastName == rhs.lastName && lhs.firstName == rhs.firstName && lhs.subject == rhs.subject
    }
}
