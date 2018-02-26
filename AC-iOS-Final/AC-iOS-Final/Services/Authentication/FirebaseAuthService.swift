//
//  FirebaseAuthService.swift
//  AC-iOS-Final
//
//  Created by Maryann Yin on 2/26/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import Foundation
import Firebase

@objc protocol FirebaseAuthServiceDelegate: class {
    
    @objc optional func didFailCreatingUser(_ authService: FirebaseAuthService, error: Error)
    @objc optional func didCreateUser(_ authService: FirebaseAuthService, user: User)
    
    @objc optional func didFailSignIn(_ authService: FirebaseAuthService, error: Error)
    @objc optional func didSignIn(_ authService: FirebaseAuthService, user: User)
    
    @objc optional func didFailSigningOut(_ authService: FirebaseAuthService, error: Error)
    @objc optional func didSignOut(_ authService: FirebaseAuthService)
    
}

//NSObject is the umbrella term for all objects (you need this when you're calling objective-c delegates and protocols because otherwise, XCode won't be able to assign the type through type inference)
//optional functions are functions that may not be called (functions that you don't necessarily need to implement)
//static functions can be called from anywhere throughout the project (e.g. FirebaseAuthService.getCurrentUser)

class FirebaseAuthService: NSObject {
    
    //whenever you want to use any delegates, you have to make an instance of the delegate; when declaring that instance, use a weak variable
    weak var delegate: FirebaseAuthServiceDelegate?
    
    //this function identifies a user whose information is stored in the Firebase authenetication and is logged in
    public static func getCurrentUser() -> User? {
        return Auth.auth().currentUser
    }
    
    //this function allows a user to create an account and have their information stored in Firebase
    public func createUser(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if let error = error {
                self.delegate?.didFailCreatingUser?(self, error: error)
            } else if let user = user {
                self.delegate?.didCreateUser?(self, user: user)
            }
        }
    }
    
    //this function allows a user who has already created an account to sign in
    public func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if let error = error {
                self.delegate?.didFailSignIn?(self, error: error)
            } else if let user = user{
                self.delegate?.didSignIn?(self, user: user)
            }
        }
    }
    
    //this function allows a user to sign out of their account
    public func signOut() {
        do {
            try Auth.auth().signOut()
            delegate?.didSignOut?(self)
            print("Sign out is successful.")
        } catch {
            delegate?.didFailSigningOut?(self, error: error)
        }
    }
    
}
