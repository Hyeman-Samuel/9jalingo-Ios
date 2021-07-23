//
//  AuthViewController.swift
//  9jalingo
//
//  Created by Samuel Hyeman on 23/07/2021.
//

import UIKit

class AuthViewController: UIViewController {

    @IBOutlet weak var createAccountButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loginButton.layer.borderWidth = 1
        loginButton.layer.borderColor = #colorLiteral(red: 0.5245240331, green: 0.2633883655, blue: 0.148385942, alpha: 1)
        loginButton.layer.cornerRadius = loginButton.frame.height/2
        createAccountButton.layer.cornerRadius = createAccountButton.frame.height/2
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func createAccountPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
          // Instantiate View Controller
        let viewController = storyboard.instantiateViewController(withIdentifier: "SignupViewController") as! SignupViewController
        viewController.modalTransitionStyle = .coverVertical
        viewController.modalPresentationStyle = .fullScreen
            present(viewController, animated: true, completion: nil)
    }
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        
    }
}
