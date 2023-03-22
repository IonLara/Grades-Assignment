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
    
    override func getGrade() -> (Double, Double) {
        return (finalGrade, (attendanceGrade * ATTENDANCEVALUE) + (projectGrade * PROJECTVALUE) + (midtermGrade * MIDTERMVALUE) + (finalGrade * FINALVALUE))
    }
    
    init(firstName: String, lastName: String, attendanceGrade: Double, projectGrade: Double, midtermGrade: Double, finalGrade: Double) {
        self.attendanceGrade = attendanceGrade
        self.projectGrade = projectGrade
        self.midtermGrade = midtermGrade
        self.finalGrade = finalGrade
        super.init(firstName: firstName, lastName: lastName, subject: .History)
    }
}
