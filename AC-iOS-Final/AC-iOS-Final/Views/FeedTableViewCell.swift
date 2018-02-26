//
//  FeedTableViewCell.swift
//  AC-iOS-Final
//
//  Created by Maryann Yin on 2/26/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
    
    lazy var dataContainer: UIView = {
        let dc = UIView()
        dc.backgroundColor = .white
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
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: "CategoryCell")
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setupViews() {
    }
    
    private func setupDataContainer() {
        addSubview(dataContainer)
        dataContainer.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [dataContainer.centerXAnchor.constraint(equalTo: centerXAnchor),
             dataContainer.centerYAnchor.constraint(equalTo: centerYAnchor)])
    }
    
    private func setupCommentTextView: UITextView = {
        addSubview(commentTextView)
        commentTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [commentTextView.centerXAnchor.constraint(equalTo: centerXAnchor),
            commentTextView.centerYAnchor.constraint(equalTo: centerYAnchor),
            commentTextView.topAnchor.constraint(equalTo: dataContainer.backgroundColor, constant: 2)])
    }

}
