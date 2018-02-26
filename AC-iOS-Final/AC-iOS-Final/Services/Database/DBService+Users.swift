//
//  DBService+Users.swift
//  AC-iOS-Final
//
//  Created by Maryann Yin on 2/26/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import Foundation
import UIKit
import Firebase

extension DBService {
    public func addUser() {
        let user = DBService.manager.getUsers().child(FirebaseAuthService.getCurrentUser()!.uid)
        user.setValue(["userID" : FirebaseAuthService.getCurrentUser()!.uid,
                       "userEmail" : FirebaseAuthService.getCurrentUser()!.email]) { (error, dbRef) in
                        if let error = error {
                            print("addUser error: \(error.localizedDescription)")
                        } else {
                            print("user has been added to the database reference: \(dbRef)")
                        }
        }
    }
    
}

