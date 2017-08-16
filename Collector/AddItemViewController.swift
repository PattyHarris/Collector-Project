//
//  AddItemViewController.swift
//  Collector
//
//  Created by Patty Harris on 8/16/17.
//  Copyright © 2017 Patty Harris. All rights reserved.
//

import UIKit

// Note: Both delegates here are needed for the image picker.

class AddItemViewController: UIViewController,
                             UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemTextField: UITextField!
    
    var imagePicker : UIImagePickerController = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self

    }

    @IBAction func cameraButtonDidTap(_ sender: Any) {
    }
    
    @IBAction func folderButtonDidTap(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    // This is called after the picker closes with the data picked.
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]) {
        
        // The dictionary contains the data for what was picked.
        if let chosenImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            itemImageView.image = chosenImage
            imagePicker.dismiss(animated: true, completion: nil)
        }
        
    }
    
    @IBAction func addButtonDidTap(_ sender: Any) {
    }
    
}
