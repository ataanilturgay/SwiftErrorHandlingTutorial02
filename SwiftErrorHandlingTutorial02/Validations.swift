//
//  Validations.swift
//  SwiftTutorial01
//
//  Created by Ata Anil Turgay on 17/06/2021.
//

import Foundation

final class LoginValidations {
    
    static let shared = LoginValidations()
    
    public enum LoginError: Error {
        
        case incompleteForm, invalidEmail, incorrectPasswordLength
        
        var title: String {
            
            switch self {
            case .incompleteForm:
                return "Incomplete form"
            case .invalidEmail:
                return "Invalid Email entered"
            case .incorrectPasswordLength:
                return "Incorrect Password Type"
            }
        }
        
        var message: String {
            
            switch self {
            case .incompleteForm:
                return "Fill both email and password fields."
            case .invalidEmail:
                return "Make sure you format the email correctly."
            case .incorrectPasswordLength:
                return "Password should be at least 8 chars."
            }
        }
    }
            
    func login(emailString: String, passwordString: String) throws {

        if emailString.isEmpty || passwordString.isEmpty {
            throw LoginError.incompleteForm
        }
        
        if !ValidationRegex.email.validate(emailString) {
            throw LoginError.invalidEmail
        }
        
        if passwordString.trimmingCharacters(in: .whitespacesAndNewlines).count < 8 {
            throw LoginError.incorrectPasswordLength
        }
    }
}

fileprivate enum ValidationRegex {
    
    case email
    
    var regex: String {
        return "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    }
    
    func validate(_ text: String?) -> Bool {

        guard let text = text else {
            return false
        }

        let test = NSPredicate(format: "SELF MATCHES %@", self.regex)
        return test.evaluate(with: text)
    }
}
