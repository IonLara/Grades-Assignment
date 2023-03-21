//
//  Math.swift
//  Student Grades
//
//  Created by Ion Sebastian Rodriguez Lara on 20/03/23.
//

import Foundation

class Math: Subject {
    private let QUIZZESVALUE = 0.15
    private let TESTSVALUE = 0.25
    private let FINALVALUE = 0.35
    
    private let quizzesGrades: [Double]
    private let testsGrades: [Double]
    private let finalGrade: Double
    
    func getGrade() -> Int {
        var grade = 0.0
        
        return Int(grade)
    }
    
    init(firstName: String, lastName: String, subject: Subject.Subjects, quizzesGrades: [Double], testsGrades: [Double], finalGrade: Double) {
        self.quizzesGrades = quizzesGrades
        self.testsGrades = testsGrades
        self.finalGrade = finalGrade
        super.init(firstName: firstName, lastName: lastName, subject: subject)
    }
}
