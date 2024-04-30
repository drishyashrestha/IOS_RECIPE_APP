//
//  LoginViewController.swift
//  Recipe Repository
//
//  Created by Drishya Shrestha on 4/17/24.
//

import UIKit
import Firebase
class LoginViewController: UIViewController {
    @IBOutlet weak var emailLabel: UITextField!
    
    @IBOutlet weak var PasswordLabel: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func LoginClicked(_ sender: UIButton) {
        guard let email = emailLabel.text else { return}
        guard let password = PasswordLabel.text else { return}
        
        Auth.auth().signIn(withEmail: email, password: password) { firebaseResult, error in
            if let e = error{
                print("!ERROR")
            }
            else {
                self.performSegue(withIdentifier: "goToNext", sender: self)
                // Go to our home screen
                
            }
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
