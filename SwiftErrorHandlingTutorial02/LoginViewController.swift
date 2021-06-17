//
//  LoginViewController.swift
//  SwiftTutorial01
//
//  Created by Ata Anil Turgay on 17/06/2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
        do {
            try LoginValidations.shared.login(emailString: emailTextField.text!,
                                              passwordString: passwordTextField.text!)
            
        } catch LoginValidations.LoginError.incompleteForm {
            
            Alert.showAlert(title: LoginValidations.LoginError.incompleteForm.title,
                            message: LoginValidations.LoginError.invalidEmail.message,
                            vc: self)
            
        } catch LoginValidations.LoginError.invalidEmail {
            
            Alert.showAlert(title: LoginValidations.LoginError.invalidEmail.title,
                            message: LoginValidations.LoginError.invalidEmail.message,
                            vc: self)
            
        } catch LoginValidations.LoginError.incorrectPasswordLength {
            
            Alert.showAlert(title: LoginValidations.LoginError.incorrectPasswordLength.title,
                            message: LoginValidations.LoginError.incorrectPasswordLength.message,
                            vc: self)
        } catch {
            Alert.showAlert(title: "Unable to login",
                            message: "There was an unknown error.",
                            vc: self)
        }
    }
}
