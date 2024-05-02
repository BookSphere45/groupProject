//
//  LoginViewController.swift
//  BookSphere
//
//  Created by Corey Taylor on 4/29/24.
//

import UIKit
import ParseSwift
import Foundation

class LoginViewController: UIViewController {
    
  
    

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signUp(_ sender: Any) {
        var newUser = User()
        newUser.username = usernameField.text
        
        newUser.password = passwordField.text

        newUser.signup { [weak self] result in

            switch result {
            case .success(let user):

                print("✅ Successfully signed up user \(user)")
                
                
                
                // Post a notification that the user has successfully signed up.
                NotificationCenter.default.post(name: Notification.Name("login"), object: nil)

            case .failure(let error):
                // Failed sign up
                self?.showAlert(description: error.localizedDescription)
            }
        }

        
        
    }
    @IBAction func onLoginTapped(_ sender: Any) {

        // Make sure all fields are non-nil and non-empty.
        guard let username = usernameField.text,
              let password = passwordField.text,
              !username.isEmpty,
              !password.isEmpty else {

            showMissingFieldsAlert()
            return
        }
        User.login(username: username, password: password) { [weak self] result in

            switch result {
            case .success(let user):
                print("✅ Successfully logged in as user: \(user)")
                
                // Post a notification that the user has successfully logged in.
                NotificationCenter.default.post(name: Notification.Name("login"), object: nil)

            case .failure(let error):
                self?.showAlert(description: error.localizedDescription)
            }
        }

    }

    private func showAlert(description: String?) {
        let alertController = UIAlertController(title: "Unable to Log in", message: description ?? "Unknown error", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(action)
        present(alertController, animated: true)
    }

    private func showMissingFieldsAlert() {
        let alertController = UIAlertController(title: "Opps...", message: "We need all fields filled out in order to log you in.", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(action)
        present(alertController, animated: true)
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
