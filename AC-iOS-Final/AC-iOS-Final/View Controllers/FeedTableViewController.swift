//
//  FeedTableViewController.swift
//  AC-iOS-Final
//
//  Created by Maryann Yin on 2/26/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit
import Firebase

class FeedTableViewController: UITableViewController {
    
    var userPosts = [Post]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    let fireBaseAuth = FirebaseAuthService()
    
    override func viewWillAppear(_ animated: Bool) {
        if FirebaseAuthService.getCurrentUser() == nil {
            let loginVC = LoginViewController()
            present(loginVC, animated: true, completion: nil)
        } else {
            //This code is for loading the categories into the tableview.
            DBService.manager.getPosts().observe(.value) { (snapshot) in
                var thePosts = [Post]()
                for child in snapshot.children {
                    let dataSnapshot = child as! DataSnapshot
                    if let dict = dataSnapshot.value as? [String: Any] {
                        let appUserPosts = Post.init(dict: dict)
                        thePosts.append(appUserPosts)
                    }
                }
                self.userPosts = thePosts
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        tableView.register(FeedTableViewCell.self, forCellReuseIdentifier: "FeedCell")
        fireBaseAuth.delegate = self as? FirebaseAuthServiceDelegate
        setupNavBar()
    }
    
    private func setupNavBar() {
        navigationItem.title = "Meatly"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logOutOfApp))
    }
    
    //This sets up the parameters for what the alert should do if a user leaves the add category textfields empty.
    private func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { alert in }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    //This code is what allows the user to log out upon pushing the log out button (log out button can be found in the nav bar block of code.
    @objc private func logOutOfApp() {
        fireBaseAuth.signOut()
        print("User has logged out.")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userPosts.count
    }
    
    //This code sets up the cells within the table view.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedCell", for: indexPath) as! FeedTableViewCell
        let post = userPosts[indexPath.row]
        cell.dataContainer = userPosts
        cell.commentTextView = userPosts
        return cell
    }
    
}

//this extension segues from the user's selected category into the flashcard view using dependency injection
extension CategoryTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCategory = categories[indexPath.row]
        let flashCardVC = FlashCardViewController(selectedCategory: selectedCategory)
        //present (flashCardVC, animated: true, completion: nil)
        self.navigationController?.pushViewController(flashCardVC, animated: true) //this is what you use when you want to push a new view controller onto the same navigation controller
    }
}

//This extension establishes a delegate for the Firebae Authentication Service.
extension CategoryTableViewController: FirebaseAuthServiceDelegate {
    
    //This function is called when the user successfully signs out.
    func didSignOut(_ authService: FirebaseAuthService) {
        let loginVC = LoginViewController()
        present(loginVC, animated: true, completion: nil)
    }
    
    //This function is called when the user failed to sign out.
    func didFailSigningOut(_ authService: FirebaseAuthService, error: Error) {
        showAlert(title: "Sign Out Error", message: error.localizedDescription)
    }

}
