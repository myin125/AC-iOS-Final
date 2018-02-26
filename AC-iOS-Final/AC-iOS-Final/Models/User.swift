//
//  User.swift
//  AC-iOS-Final
//
//  Created by Maryann Yin on 2/26/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import Foundation

struct User: Codable {
    
    let userID: String
    let userSavedPosts: [String]
    
    init(dict: [String : Any]) {
        userID = dict["userID"] as? String ?? ""
        userSavedPosts = dict["userSavedPosts"] as? [String] ?? [String]()
    }
    
}

