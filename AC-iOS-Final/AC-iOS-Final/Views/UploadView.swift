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
    
    lazy var captionTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Insert Caption Here"
        textField.textAlignment = .center
        textField.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.medium)
        textField.autocapitalizationType = .sentences
        textField.autocorrectionType = .yes
        textField.textColor = UIColor.black
        textField.backgroundColor = UIColor.lightGray
        return textField
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
        setupCaptionTextField()
    }
    
    private func setupButtonImage() {
        addSubview(postImage)
        postImage.translatesAutoresizingMaskIntoConstraints = false
        postImage.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
        postImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 25).isActive = true
        postImage.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.95).isActive = true
        postImage.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.55).isActive = true
    }
    
    private func setupCaptionTextField() {
        addSubview(captionTextField)
        captionTextField.translatesAutoresizingMaskIntoConstraints = false
        captionTextField.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
        captionTextField.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 5).isActive = true
        captionTextField.widthAnchor.constraint(equalTo: postImage.widthAnchor, multiplier: 0.95).isActive = true
        captionTextField.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.35).isActive = true
    }
    
}
