//
//  LoginView.swift
//  AC-iOS-Final
//
//  Created by Maryann Yin on 2/26/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class LoginView: UIView {
    
    lazy var appLogoImage: UIImageView = {
        let meaty = UIImageView()
        meaty.image = #imageLiteral(resourceName: "meatly_logo")
        meaty.contentMode = .scaleAspectFit
        return meaty
    }()
    
    lazy var emailAddressLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.bold)
        label.text = "Email: "
        label.textAlignment = .right
        label.textColor = UIColor.black
        return label
    }()
    
    lazy var passwordAddressLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.bold)
        label.textAlignment = .right
        label.text = "Password: "
        label.textColor = UIColor.black
        return label
    }()
    
    lazy var emailLoginTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.medium)
        textField.placeholder = "Email Address Login"
        textField.layer.cornerRadius = 5
        textField.borderStyle = .roundedRect
        let myColor : UIColor = UIColor( red: 0, green: 0, blue: 1.0, alpha: 1.0 )
        textField.layer.borderColor = myColor.cgColor
        textField.textColor = UIColor.black
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.medium)
        textField.placeholder = "Password"
        textField.borderStyle = .roundedRect
        let myColor : UIColor = UIColor( red: 0, green: 0, blue: 1.0, alpha: 1.0 )
        textField.layer.borderColor = myColor.cgColor
        textField.isSecureTextEntry = true // this helps to obscure the user's password with *******
        textField.textColor = UIColor.black
        return textField
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: UIControlState.normal)
        button.setTitleColor(UIColor.blue, for: UIControlState.normal)
        button.backgroundColor = UIColor.clear
        button.layer.cornerRadius = 4
        return button
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Register", for: UIControlState.normal)
        button.setTitleColor(UIColor.blue, for: UIControlState.normal)
        button.backgroundColor = UIColor.clear
        button.layer.cornerRadius = 4
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .white
        setupViews()
    }
    
    private func setupViews() {
        //setupAppNameLabel()
        setupAppLogoImage()
        setupEmailTextField()
        setupPasswordTextField()
        setupEmailLabel()
        setupPasswordLabel()
        setupLoginButton()
        setupRegisterButton()
    }
    
    private func setupAppLogoImage() {
        addSubview(appLogoImage)
        appLogoImage.translatesAutoresizingMaskIntoConstraints = false
        appLogoImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 70).isActive = true
        appLogoImage.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
        appLogoImage.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.75).isActive = true
        appLogoImage.heightAnchor.constraint(equalTo: appLogoImage.widthAnchor, multiplier: 0.75).isActive = true
    }
    
    private func setupEmailTextField() {
        addSubview(emailLoginTextField)
        emailLoginTextField.translatesAutoresizingMaskIntoConstraints = false
        emailLoginTextField.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        emailLoginTextField.topAnchor.constraint(equalTo: appLogoImage.bottomAnchor, constant: 30).isActive = true
        emailLoginTextField.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.5).isActive = true
    }
    
    private func setupPasswordTextField() {
        addSubview(passwordTextField)
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.topAnchor.constraint(equalTo: emailLoginTextField.bottomAnchor, constant: 15).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: emailLoginTextField.widthAnchor).isActive = true
        passwordTextField.centerXAnchor.constraint(equalTo: emailLoginTextField.centerXAnchor).isActive = true
    }
    
    private func setupEmailLabel() {
        addSubview(emailAddressLabel)
        emailAddressLabel.translatesAutoresizingMaskIntoConstraints = false
        emailAddressLabel.topAnchor.constraint(equalTo: emailLoginTextField.topAnchor).isActive = true
        emailAddressLabel.trailingAnchor.constraint(equalTo: emailLoginTextField.leadingAnchor, constant: -3).isActive = true
        emailAddressLabel.centerYAnchor.constraint(equalTo: emailLoginTextField.centerYAnchor).isActive = true
        emailAddressLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
    }
    
    private func setupPasswordLabel() {
        addSubview(passwordAddressLabel)
        passwordAddressLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordAddressLabel.topAnchor.constraint(equalTo: passwordTextField.topAnchor).isActive = true
        passwordAddressLabel.trailingAnchor.constraint(equalTo: passwordTextField.leadingAnchor, constant: -3).isActive = true
        passwordAddressLabel.centerYAnchor.constraint(equalTo: passwordTextField.centerYAnchor).isActive = true
        passwordAddressLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
    }
    
    private func setupLoginButton() {
        addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
        loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant:50).isActive = true
        loginButton.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.3).isActive = true
    }
    
    private func setupRegisterButton() {
        addSubview(registerButton)
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        registerButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
        registerButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20).isActive = true
        registerButton.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.60).isActive = true
    }
    
}
