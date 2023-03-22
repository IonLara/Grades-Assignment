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
    let subject: Subjects
    enum Subjects {
        case English
        case Math
        case History
    }
    
    var description: String {
        let names = String("\(firstName) \(lastName)").padding(toLength: 42, withPad: " ", startingAt: 0)
        let grades = getGrade()
        let finalExam = String("\(Int(grades.finalExam))").padding(toLength: 8, withPad: " ", startingAt: 0)
        let finalGrade = String(format: "%.2f",grades.finalGrade).padding(toLength: 8, withPad: " ", startingAt: 0)
        var letterGrade = getLetter()
        
        return "\(names)\(finalExam)\(finalGrade)\(letterGrade)"
    }
    
    init(firstName: String, lastName: String, subject: Subjects) {
        self.firstName = firstName
        self.lastName = lastName
        self.subject = subject
    }
    
    func getLetter() -> String {
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
    
    func getGrade() -> (finalExam: Double, finalGrade: Double){
        (100, 100)
    }
    
    static func <(lhs: Subject, rhs: Subject) -> Bool {
        lhs.lastName < rhs.lastName
    }
    static func ==(lhs: Subject, rhs: Subject) -> Bool {
        lhs.lastName == rhs.lastName && lhs.firstName == rhs.firstName && lhs.subject == rhs.subject
    }
}
