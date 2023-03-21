//
//  English.swift
//  Student Grades
//
//  Created by Ion Sebastian Rodriguez Lara on 20/03/23.
//

import Foundation

class English: Subject {
    private let PAPERVALUE = 0.25
    private let MIDTERMVALUE = 0.35
    private let FINALVALUE = 0.45
    
    private let paperGrade: Double
    private let midtermGrade: Double
    private let finalGrade: Double
    
    func getGrade() -> Int {
        var grade = 0.0
        
        return Int(grade)
    }
    
    init(firstName: String, lastName: String, subject: Subject.Subjects, paperGrade: Double, midtermGrade: Double, finalGrade: Double) {
        self.paperGrade = paperGrade
        self.midtermGrade = midtermGrade
        self.finalGrade = finalGrade
        super.init(firstName: firstName, lastName: lastName, subject: subject)   
    }
}
