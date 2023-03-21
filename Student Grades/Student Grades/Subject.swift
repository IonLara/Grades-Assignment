//
//  Subject.swift
//  Student Grades
//
//  Created by Ion Sebastian Rodriguez Lara on 20/03/23.
//

import Foundation

class Subject {
    private let firstName: String
    private let lastName: String
    private let subject: Subjects
    enum Subjects {
        case English
        case Math
        case History
    }
    
    init(firstName: String, lastName: String, subject: Subjects) {
        self.firstName = firstName
        self.lastName = lastName
        self.subject = subject
    }
}
