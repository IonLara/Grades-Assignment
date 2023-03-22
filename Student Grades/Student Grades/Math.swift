//
//  Math.swift
//  Student Grades
//
//  Created by Ion Sebastian Rodriguez Lara on 20/03/23.
//

import Foundation

class Math: Subject {
    private let QUIZZESVALUE = 0.15 //Value of quizzes average
    private let TESTSVALUE = 0.25 //Value of each test
    private let FINALVALUE = 0.35 //Value of final exam
    
    private let quizzesGrades: [Double] //Array with each quizzes grades
    private let testsGrades: [Double] //Array with both tests grades
    private let finalGrade: Double //Final exam's grade
    
    override func getGrade() -> (Double, Double) { //Override function to return respective grades
        var quizzAverage = 0.0 //Variable for quizz average
        for quizzesGrade in quizzesGrades {
            quizzAverage += quizzesGrade //Add quiz result to average
        }
        quizzAverage /= Double(quizzesGrades.count) //Get average by dividing by number of quizzes
        return (finalGrade, (quizzAverage * QUIZZESVALUE) + (testsGrades[0] * TESTSVALUE) + (testsGrades[1] * TESTSVALUE) + (finalGrade * FINALVALUE))
    }
    //Initializer for subclass
    init(firstName: String, lastName: String, quizzesGrades: [Double], testsGrades: [Double], finalGrade: Double) {
        self.quizzesGrades = quizzesGrades
        self.testsGrades = testsGrades
        self.finalGrade = finalGrade
        super.init(firstName: firstName, lastName: lastName, subject: .Math)
    }
}
