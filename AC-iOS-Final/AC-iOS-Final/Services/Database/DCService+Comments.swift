//
//  DCService+Comments.swift
//  AC-iOS-Final
//
//  Created by Maryann Yin on 2/26/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import Foundation
import Firebase

extension DBService {
    
    public func addComment(comment: String) {
        let commentDBref = DBService.manager.getComments().childByAutoId()
        commentDBref.setValue([    "userID" : FirebaseAuthService.getCurrentUser()!.uid,
                                   "postID" : ,
                                   "commentID" : comment]) { (error, dbRef) in
                                    if let error = error {
                                        print("addPost error: \(error.localizedDescription)")
                                    } else {
                                        print("new post has been added to the database reference: \(dbRef)")
                                    }
        }
    }
    
}

