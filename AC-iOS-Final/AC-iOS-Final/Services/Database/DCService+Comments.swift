//
//  DCService+Comments.swift
//  AC-iOS-Final
//
//  Created by Maryann Yin on 2/26/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import Foundation
import UIKit
import Firebase

extension DBService {
    
    public func addComment(post: Post, commentStr: String) {
        let childByAutoId = DBService.manager.getComments().childByAutoId()
        childByAutoId.setValue(["userID" : FirebaseAuthService.getCurrentUser()?.uid,
                                "postID" : post.postID,
                                "postImageStr" : post.postImageStr,
                                "commentID"        : childByAutoId.key,
                                "commentStr"       : commentStr]) { (error, dbRef) in
                                    if let error = error {
                                        print("addComments error: \(error)")
                                    } else {
                                        print("comments added @ database reference: \(dbRef)")
                                    }
                                }
    }
    
    public func loadAllComments(postID: String, completionHandler: @escaping ([Comment]?) -> Void) {
        let ref = DBService.manager.getComments()
        ref.observe(.value) { (snapshot) in
            var allComments = [Comment]()
            for child in snapshot.children {
                let dataSnapshot = child as! DataSnapshot
                if let dict = dataSnapshot.value as? [String: Any] {
                    let comment = Comment.init(dict: dict)
                    if comment.postID == postID {
                        allComments.append(comment)
                    }
                }
            }
            completionHandler(allComments)
        }
    }
    
}
