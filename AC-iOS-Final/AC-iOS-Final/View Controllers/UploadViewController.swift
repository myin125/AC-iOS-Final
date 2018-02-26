//
//  UploadViewController.swift
//  AC-iOS-Final
//
//  Created by Maryann Yin on 2/26/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit
import Firebase

class UploadViewController: UIViewController {
    
    let uploadViewPage = UploadView()
    
    let fireBaseAuth = FirebaseAuthService()
    
    var selectedImage: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(uploadViewPage)
        setupImagePicker()
    }
    
    func setupImagePicker() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(cameraRollImagePicker))
        uploadViewPage.postImage.addGestureRecognizer(tap)
        uploadViewPage.postImage.isUserInteractionEnabled = true
    }
    
    @objc func cameraRollImagePicker() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        self.present(imagePicker, animated: true, completion: nil)
    }
    
}

extension UploadViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info ["UIImagePickerControllerOriginalImage"] as? UIImage{
            selectedImage = image
            uploadViewPage.postImage.image = image
        }
        dismiss(animated: true, completion: nil)
    }
}
