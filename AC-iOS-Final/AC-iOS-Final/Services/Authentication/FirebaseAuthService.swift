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

class FirebaseAuthService: NSObject {
    
    weak var delegate: FirebaseAuthServiceDelegate?
    
    public static func getCurrentUser() -> User? {
        return Auth.auth().currentUser
    }
    
    public func createUser(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if let error = error {
                self.delegate?.didFailCreatingUser?(self, error: error)
            } else if let user = user {
                self.delegate?.didCreateUser?(self, user: user)
            }
        }
    }
    
    public func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if let error = error {
                self.delegate?.didFailSignIn?(self, error: error)
            } else if let user = user{
                self.delegate?.didSignIn?(self, user: user)
            }
        }
    }
    
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
