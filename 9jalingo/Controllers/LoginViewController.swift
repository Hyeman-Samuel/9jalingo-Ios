//
//  LoginViewController.swift
//  9jalingo
//
//  Created by Samuel Hyeman on 23/07/2021.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameField: LingoTextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameField.setCorner(radius: 10)
        usernameField.setBorder(width: 1, color: .systemBackground)
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
}
