//
//  DBService.swift
//  AC-iOS-Final
//
//  Created by Maryann Yin on 2/26/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import Foundation
import FirebaseDatabase

class DBService {
    
    //MARK: Properties
    private var dbRef: DatabaseReference!
    private var usersRef: DatabaseReference!
    private var postsRef: DatabaseReference!
    private var commentsRef: DatabaseReference!
    
    
    private init(){
        // reference to the root of the Firebase database
        dbRef = Database.database().reference()
        
        // children of root database node
        usersRef = dbRef.child("users")
        postsRef = dbRef.child("posts")
        commentsRef = dbRef.child("comments")
    }
    
    //this allows this singleton to be accessible everywhere throughout your app without needing to call an instance of it
    static let manager = DBService()
    
    public func getDB()-> DatabaseReference { return dbRef }
    public func getUsers()-> DatabaseReference { return usersRef }
    public func getPosts()-> DatabaseReference { return postsRef }
    public func getComments()-> DatabaseReference { return commentsRef }
}
