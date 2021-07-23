//
//  PasswordViewController.swift
//  9jalingo
//
//  Created by Samuel Hyeman on 22/07/2021.
//

import UIKit

class PasswordViewController: UIViewController {

    @IBOutlet weak var completeButton: UIButton!
    @IBOutlet weak var passwordField: LingoTextView!
    var pageDelegate:PageDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordField.circleCorner()
        passwordField.setBorder(width: 2, color: .white)
        completeButton.layer.cornerRadius = completeButton.frame.height/2
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
    @IBAction func completeButtonPressed(_ sender: Any) {
        pageDelegate?.nextPage(oldPage: self)
    }
    
}
