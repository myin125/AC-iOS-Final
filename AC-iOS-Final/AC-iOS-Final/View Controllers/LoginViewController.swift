//
//  LoginViewController.swift
//  AC-iOS-Final
//
//  Created by Maryann Yin on 2/26/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    let loginView = LoginView()
    
    let fireBaseAuth = FirebaseAuthService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        view.addSubview(loginView)
        fireBaseAuth.delegate = self
        setupLoginButtonAction()
        setupRegisterButtonAction()
    }
    
    //This function is code for when the user touches the login button.
    func setupLoginButtonAction() {
        loginView.loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
    }
    
    //This function is code for firebase to check the text inside the login textfields and see if they match the database.
    @objc func login() {
        fireBaseAuth.signIn(email: loginView.emailLoginTextField.text!, password: loginView.passwordTextField.text!)
    }
    
    //This function is code for when the user touches the create user account button.
    func setupRegisterButtonAction() {
        loginView.registerButton.addTarget(self, action: #selector(newUser), for: .touchUpInside)
    }
    
    //This function is code for firebase to check the text inside the login textfields and to add the new user account information to the auth.
    @objc func newUser() {
        fireBaseAuth.createUser(email: loginView.emailLoginTextField.text!, password: loginView.passwordTextField.text!)
    }
    
    //This function determines the function of an alert.
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { alert in }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
}

extension LoginViewController: FirebaseAuthServiceDelegate {
    
    //This function is called when creating a new user account fails.
    //.localizedDescription gives you a detailed error message (short and succinct); .description just turns the text into a string.
    func didFailCreatingUser(_ authService: FirebaseAuthService, error: Error) {
        //A call for the show alert function to alert the user that an error has occurred.
        showAlert(title: "Error", message: error.localizedDescription)
    }
    
    //This function is called when creating a new user account is successful.
    func didCreateUser(_ authService: FirebaseAuthService, user: User) {
        dismiss(animated: true, completion: nil) //This code dismisses the Login View.
    }
    
    //This function is called when the user successfully signs in.
    func didSignIn(_ authService: FirebaseAuthService, user: User) {
        dismiss(animated: true, completion: nil) //This code dismisses the Login View.
    }
    
    //This function is called when the user failed to sign in.
    func didFailSignIn(_ authService: FirebaseAuthService, error: Error) {
        //A call for the show alert function to alert the user that an error has occurred.
        showAlert(title: "Sign In Error", message: error.localizedDescription)
    }
    
    //this function is called when the user successfully signs out
    func didSignOut(_ authService: FirebaseAuthService) {
        //A call for the show alert function to alert the user that sign out has happened.
        showAlert(title: "Sign Out Success", message: "Have a good day!")
    }
    
    //this function is called when the user failed to sign out
    func didFailSigningOut(_ authService: FirebaseAuthService, error: Error) {
        //A call for the show alert function to alert the user that an error has occurred.
        showAlert(title: "Sign Out Error", message: error.localizedDescription)
    }
    
}
