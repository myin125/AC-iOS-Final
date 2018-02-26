//
//  Comment.swift
//  AC-iOS-Final
//
//  Created by Maryann Yin on 2/26/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import Foundation

class Comment {
    
    let commentID: String
    let commentStr: String
    let userID: String
    let postID: String
    let postImageStr: String
    
    init(dict: [String : Any]) {
        commentID = dict["commentID"] as? String ?? ""
        commentStr = dict["commentStr"] as? String ?? ""
        userID = dict["userID"] as? String ?? ""
        postID = dict["postID"] as? String ?? ""
        postImageStr = dict["postImageStr"] as? String ?? ""
    }
    
}
