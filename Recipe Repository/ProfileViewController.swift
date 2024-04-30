//
//  ProfileViewController.swift
//  Recipe Repository
//
//  Created by Drishya Shrestha on 4/30/24.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController {
    
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    
    
    @IBAction func SignOut(_ sender: Any) {
        do {
                    try Auth.auth().signOut()
                    
                    // Redirect the user to the login or registration view
                    navigateToLoginOrRegistration()
                } catch {
                    // Handle any potential sign-out error
                    showAlert("Sign-Out Error", error.localizedDescription)
                }
        
        
    }
    // Set up profile data
            
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImageView.image = UIImage(named: "pp.jpg")
        profileImageView.layer.cornerRadius = profileImageView.bounds.width / 2
        profileImageView.clipsToBounds = true

        // Do any additional setup after loading the view.
    }
    func showAlert(_ title: String, _ message: String) {
           // Create an alert controller with the specified title and message
           let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
           
           // Add an OK button to the alert
           alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
           
           // Present the alert
           present(alertController, animated: true, completion: nil)
       }
    func navigateToLoginOrRegistration() {
            // Depending on your app's architecture, you can use one of the following methods:
            
            // 1. Perform a segue to navigate to the login or registration view
            // self.performSegue(withIdentifier: "yourSegueIdentifier", sender: self)
            
            // OR
            
            // 2. Instantiate the login or registration view controller directly and present it
            // (Make sure to replace "LoginViewController" with the appropriate class name of your login/registration view controller)
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let loginViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as? UIViewController {
                // Set the modal presentation style if necessary
                loginViewController.modalPresentationStyle = .fullScreen
                
                // Present the login view controller
                present(loginViewController, animated: true, completion: nil)
            }
        }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
