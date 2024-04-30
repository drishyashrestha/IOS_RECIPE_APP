//
//  RegisterViewController.swift
//  Recipe Repository
//
//  Created by Drishya Shrestha on 4/17/24.
//



import UIKit
import Firebase
class RegisterViewController: UIViewController {

    @IBOutlet weak var EmailLabel: UITextField!
    
    @IBOutlet weak var PasswordLabel: UITextField!
    
    @IBOutlet weak var PhoneLabel: UITextField!
    @IBOutlet weak var NameLabel: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func SignedClicked(_ sender: UIButton) {
        guard let email = EmailLabel.text else { return}
        guard let password = PasswordLabel.text else { return}
        guard let name = NameLabel.text else { return}
        guard let phone =
                PhoneLabel.text else{
            return}
        Auth.auth().createUser(withEmail: email, password: password) { firebaseResult, error in
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
