//
//  AddPlaceViewController.swift
//  FoursquareClone37
//
//  Created by Luke Martin-Resnick on 9/30/20.
//

import UIKit

//var globalName = ""
//var globalType = ""
//var globalAtmosphere = ""

class AddPlaceViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var placeNameTextfield: UITextField!
    @IBOutlet weak var placeTypeTextfield: UITextField!
    @IBOutlet weak var placeAtmosphereTextfield: UITextField!
    @IBOutlet weak var placeImageView: UIImageView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        placeImageView.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(chooseImage))
        placeImageView.addGestureRecognizer(gestureRecognizer)
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        
        if placeNameTextfield.text != "" && placeTypeTextfield.text != "" && placeAtmosphereTextfield.text != "" {
            if let chosenImage = placeImageView.image {
                let placeModel = PlaceModel.sharedInstance
                placeModel.placeName = placeNameTextfield.text!
                placeModel.placeType = placeTypeTextfield.text!
                placeModel.placeAtmosphere = placeAtmosphereTextfield.text!
                placeModel.placeImage = chosenImage
            }
            
            self.performSegue(withIdentifier: "toMapVC", sender: nil)
            
        } else {
            let alert = UIAlertController(title: "Error", message: "Place Name/Type/Atmosphere Missing", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(okButton)
            present(alert, animated: true, completion: nil)
            
        }
        
    }
    
    @objc func chooseImage() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        self.present(picker, animated: true, completion: nil)
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        placeImageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
