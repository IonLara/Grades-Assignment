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
    
    override func getGrade() -> (Double, Double) {
        var quizzAverage = 0.0
        for quizzesGrade in quizzesGrades {
            quizzAverage += quizzesGrade
        }
        quizzAverage /= Double(quizzesGrades.count)
        return (finalGrade, (quizzAverage * QUIZZESVALUE) + (testsGrades[0] * TESTSVALUE) + (testsGrades[1] * TESTSVALUE) + (finalGrade * FINALVALUE))
    }
    
    init(firstName: String, lastName: String, quizzesGrades: [Double], testsGrades: [Double], finalGrade: Double) {
        self.quizzesGrades = quizzesGrades
        self.testsGrades = testsGrades
        self.finalGrade = finalGrade
        super.init(firstName: firstName, lastName: lastName, subject: .Math)
    }
}
