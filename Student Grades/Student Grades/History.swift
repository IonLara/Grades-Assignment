//
//  History.swift
//  Student Grades
//
//  Created by Ion Sebastian Rodriguez Lara on 20/03/23.
//

import Foundation

class History: Subject {
    private let ATTENDANCEVALUE = 0.1 //Value of attendance
    private let PROJECTVALUE = 0.3 //Value of project
    private let MIDTERMVALUE = 0.3 //Value of midterm exam
    private let FINALVALUE = 0.3 //Value of final exam
    
    private let attendanceGrade: Double //Student's grade in attendance
    private let projectGrade: Double //Student's grade in...
    private let midtermGrade: Double //Student's grade in...
    private let finalGrade: Double //Student's grade in...
    
    override func getGrade() -> (Double, Double) { //Override function to return respective grades
        return (finalGrade, (attendanceGrade * ATTENDANCEVALUE) + (projectGrade * PROJECTVALUE) + (midtermGrade * MIDTERMVALUE) + (finalGrade * FINALVALUE))
    }
    //Initializer for subclass
    init(firstName: String, lastName: String, attendanceGrade: Double, projectGrade: Double, midtermGrade: Double, finalGrade: Double) {
        self.attendanceGrade = attendanceGrade
        self.projectGrade = projectGrade
        self.midtermGrade = midtermGrade
        self.finalGrade = finalGrade
        super.init(firstName: firstName, lastName: lastName, subject: .History)
    }
}
