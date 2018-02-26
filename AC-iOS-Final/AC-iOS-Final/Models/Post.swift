//
//  Post.swift
//  AC-iOS-Final
//
//  Created by Maryann Yin on 2/26/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import Foundation

class Post {
    
    let postID: String
    let postImageStr: String
    let userID: String
    let caption: String
    
    init(dict: [String : Any]) {
        self.postID = dict["postID"] as? String ?? ""
        self.postImageStr = dict["postImageStr"] as? String ?? ""
        self.userID = dict["userID"] as? String ?? ""
        self.caption = dict["caption"] as? String ?? ""
    }
    
}

