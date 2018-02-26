//
//  UploadView.swift
//  AC-iOS-Final
//
//  Created by Maryann Yin on 2/26/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class UploadView: UIView {
    
    lazy var postImage: UIImageView = {
        let picture = UIImageView()
        picture.image = #imageLiteral(resourceName: "camera_icon")
        picture.contentMode = .scaleAspectFit
        picture.backgroundColor = UIColor.white
        return picture
    }()
    
    lazy var captionTextView: UITextView = {
        let textView = UITextView()
        textView.isEditable = true
        textView.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.medium)
        textView.autocapitalizationType = .none
        textView.textColor = UIColor.black
        textView.backgroundColor = UIColor.lightGray
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .white
        setupViews()
    }
    
    private func setupViews() {
        setupButtonImage()
        setupCaptionTextView()
    }
    
    private func setupButtonImage() {
        addSubview(postImage)
        postImage.translatesAutoresizingMaskIntoConstraints = false
        postImage.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
        postImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 25).isActive = true
        postImage.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.95).isActive = true
        postImage.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.55).isActive = true
    }
    
    private func setupCaptionTextView() {
        addSubview(captionTextView)
        captionTextView.translatesAutoresizingMaskIntoConstraints = false
        captionTextView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
        captionTextView.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 5).isActive = true
        captionTextView.widthAnchor.constraint(equalTo: postImage.widthAnchor, multiplier: 0.95).isActive = true
        captionTextView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.35).isActive = true
    }
    
}
