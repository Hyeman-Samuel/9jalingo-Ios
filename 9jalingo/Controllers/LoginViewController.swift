//
//  LoginViewController.swift
//  9jalingo
//
//  Created by Samuel Hyeman on 23/07/2021.
//

import UIKit
import MaterialComponents.MaterialTextControls_OutlinedTextFields
class LoginViewController: UIViewController {

    @IBOutlet weak var EmailField: MDCOutlinedTextField!
    @IBOutlet weak var passwordField: MDCOutlinedTextField!
    @IBOutlet weak var submitButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        EmailField.label.text = "E-mail"
        EmailField.placeholder = "name@email.com"
        EmailField.sizeToFit()
        EmailField.setFloatingLabelColor(#colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1), for: .editing)
        EmailField.containerRadius = 10
        EmailField.setOutlineColor(#colorLiteral(red: 0.5245240331, green: 0.2633883655, blue: 0.148385942, alpha: 1), for: .normal)
        EmailField.setOutlineColor(#colorLiteral(red: 0.5245240331, green: 0.2633883655, blue: 0.148385942, alpha: 1), for: .editing)
        passwordField.label.text = "Password"
        passwordField.placeholder = "*******"
        passwordField.sizeToFit()
        passwordField.setFloatingLabelColor(#colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1), for: .editing)
        passwordField.containerRadius = 10
        passwordField.isSecureTextEntry = true
        passwordField.setOutlineColor(#colorLiteral(red: 0.5245240331, green: 0.2633883655, blue: 0.148385942, alpha: 1), for: .normal)
        passwordField.setOutlineColor(#colorLiteral(red: 0.5245240331, green: 0.2633883655, blue: 0.148385942, alpha: 1), for: .editing)
        submitButton.layer.cornerRadius = submitButton.frame.height/2
//        usernameField.setCorner(radius: 10)
//        usernameField.setBorder(width: 1, color: .systemBackground)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func submitButtonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
          // Instantiate View Controller
        let viewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! ViewController
        viewController.modalTransitionStyle = .flipHorizontal
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true, completion: nil)
        //HomeViewController
    }
    @IBAction func forgotPasswordPressed(_ sender: Any) {
    }
}
