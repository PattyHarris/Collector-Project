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
        // Again, this only works on a real phone...instead of crashing
        // I chose to make this work with an alert...
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePicker.sourceType = .camera
            present(imagePicker, animated: true, completion: nil)
        }
        else {
            showAlert(message: "Device has no camera!")
        }
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
        
        // I don't think we have the code yet for picking a photo taken using
        // the phone camera.
        
    }
    
    @IBAction func addButtonDidTap(_ sender: Any) {
        // Get the managed object context
        if let context  =
            ((UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext) {
            
            let item = Item(entity: Item.entity(), insertInto: context)
            item.title = itemTextField.text
            
            if let image = itemImageView.image {
                
                // We need to turn this object into a Data? object (optional Data..)
                if let imageData = UIImagePNGRepresentation(image) {
                    item.image = imageData
                }
            }
            
            // This can also be handled this way:
            // try? context.save
            // But then there's no handling the failure case...
            // To get the data to "reload" we need to handle
            // viewWillAppear.
            do {
                try context.save()
            }
            catch {
                self.showAlert(message: "Data could not be saved!  Please try again.")
            }
            
            navigationController?.popViewController(animated: true)
        }

    }
    
    func showAlert(message: String) {
        let alertController = UIAlertController(title: "Oops!", message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }

}
