//
//  FeedTableViewCell.swift
//  AC-iOS-Final
//
//  Created by Maryann Yin on 2/26/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit
import Foundation
import Kingfisher
import Firebase

class FeedTableViewCell: UITableViewCell {
    
    lazy var cellContainer: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        return view
    }()
    
    lazy var dataContainer: UIView = {
        let dc = UIView()
        dc.backgroundColor = UIColor.white
        return dc
    }()
    
    lazy var commentTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = UIColor.yellow
        textView.textColor = UIColor.black
        textView.isEditable = true
        textView.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.medium)
        return textView
    }()
    
    lazy var postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "bgBrunch")
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .white
        return imageView
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: "FeedCell")
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setupViews() {
        setupDataContainer()
        setupCommentTextView()
    }
    
    private func setupDataContainer() {
        addSubview(dataContainer)
        dataContainer.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [dataContainer.centerXAnchor.constraint(equalTo: centerXAnchor),
             dataContainer.centerYAnchor.constraint(equalTo: centerYAnchor)])
    }
    
    private func setupCommentTextView() {
        addSubview(commentTextView)
        commentTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [commentTextView.centerXAnchor.constraint(equalTo: centerXAnchor),
             commentTextView.centerYAnchor.constraint(equalTo: centerYAnchor),
             commentTextView.topAnchor.constraint(equalTo: dataContainer.bottomAnchor, constant: 2)])
    }
    
    private func addPostImageView() {
        addSubview(postImageView)
        postImageView.translatesAutoresizingMaskIntoConstraints = false
        postImageView.leadingAnchor.constraint(equalTo: cellContainer.leadingAnchor).isActive = true
        postImageView.trailingAnchor.constraint(equalTo: cellContainer.trailingAnchor).isActive = true
        postImageView.topAnchor.constraint(equalTo: dataContainer.topAnchor).isActive = true
        postImageView.bottomAnchor.constraint(equalTo: dataContainer.bottomAnchor).isActive = true
    }
    
//    public func configurePostCell(post: Post) {
//        commentTextView.text = post.caption
//        postImageView.kf.indicatorType = .activity
//        postImageView.kf.setImage(with: URL(string:post.postImageStr), placeholder: #imageLiteral(resourceName: "imagePH"), options: nil, progressBlock: nil, completionHandler: nil)
//        
//        let imageURL = post.postImageStr {
//            self.postImageView.kf.indicatorType = .activity
//            self.postImageView.kf.setImage(with: URL(string: post.postImageStr))
//        }
//    }

}
