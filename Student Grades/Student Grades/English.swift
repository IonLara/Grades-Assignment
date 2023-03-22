//
//  English.swift
//  Student Grades
//
//  Created by Ion Sebastian Rodriguez Lara on 20/03/23.
//

import Foundation

class English: Subject {
    private let PAPERVALUE = 0.25 //Value of the term paper
    private let MIDTERMVALUE = 0.35 //Value of midterm exam
    private let FINALVALUE = 0.45 //Value of final exam
    
    private let paperGrade: Double //Student's grade in term paper
    private let midtermGrade: Double //Student's grade in midterm exam
    private let finalGrade: Double //Student's grade in final exam
    
    override func getGrade() -> (finalExam: Double, finalGrade: Double) { //Override function to return respective grades
        return (finalGrade,(paperGrade * PAPERVALUE) + (midtermGrade * MIDTERMVALUE) + (finalGrade * FINALVALUE))
    }
    //Initializer for this subclass
    init(firstName: String, lastName: String, paperGrade: Double, midtermGrade: Double, finalGrade: Double) {
        self.paperGrade = paperGrade
        self.midtermGrade = midtermGrade
        self.finalGrade = finalGrade
        super.init(firstName: firstName, lastName: lastName, subject: .English)   
    }
}
