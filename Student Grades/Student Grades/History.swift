//
//  History.swift
//  Student Grades
//
//  Created by Ion Sebastian Rodriguez Lara on 20/03/23.
//

import Foundation

class History: Subject {
    private let ATTENDANCEVALUE = 0.1
    private let PROJECTVALUE = 0.3
    private let MIDTERMVALUE = 0.3
    private let FINALVALUE = 0.3
    
    private let attendanceGrade: Double
    private let projectGrade: Double
    private let midtermGrade: Double
    private let finalGrade: Double
    
    func getGrade() -> Int {
        var grade = 0.0
        
        return Int(grade)
    }
    
    init(firstName: String, lastName: String, subject: Subject.Subjects, attendanceGrade: Double, projectGrade: Double, midtermGrade: Double, finalGrade: Double) {
        self.attendanceGrade = attendanceGrade
        self.projectGrade = projectGrade
        self.midtermGrade = midtermGrade
        self.finalGrade = finalGrade
        super.init(firstName: firstName, lastName: lastName, subject: subject)
    }
}
