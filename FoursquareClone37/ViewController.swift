//
//  ViewController.swift
//  FoursquareClone37
//
//  Created by Luke Martin-Resnick on 9/29/20.
//

import UIKit
import Parse



class ViewController: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func signInTapped(_ sender: Any) {
        if usernameTextField.text != "" && passwordTextfield.text != "" {
            PFUser.logInWithUsername(inBackground: usernameTextField.text!, password: passwordTextfield.text!) { (user, error) in
                if error != nil {
                    self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Error")
                } else {
                    // Segue
                    self.performSegue(withIdentifier: "toPlacesVC", sender: nil)
                }
            }
        } else {
            makeAlert(titleInput: "Error", messageInput: "Username / Password??")
        }
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
        
        if usernameTextField.text != "" && passwordTextfield.text != "" {
            
            let user = PFUser()
            user.username = usernameTextField.text!
            user.password = passwordTextfield.text
            
            user.signUpInBackground { (success, error) in
                if error != nil {
                    self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Error!")
                } else {
                    self.performSegue(withIdentifier: "toPlacesVC", sender: nil)
                }
            }
            
        } else {
            makeAlert(titleInput: "Error!", messageInput: "Username / Password??")
            
        }
        
    }
    
    func makeAlert(titleInput: String, messageInput: String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    

}

