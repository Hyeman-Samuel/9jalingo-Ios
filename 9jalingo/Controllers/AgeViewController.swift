//
//  AgeViewController.swift
//  9jalingo
//
//  Created by Samuel Hyeman on 22/07/2021.
//

import UIKit

class AgeViewController: UIViewController {

    @IBOutlet weak var ageField: LingoTextView!
    @IBOutlet weak var nextButton: UIButton!
    var pageDelegate:PageDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        ageField.circleCorner()
        ageField.setBorder(width: 2, color: .white)
        nextButton.layer.cornerRadius = nextButton.frame.height/2
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
    @IBAction func nextButtonPressed(_ sender: Any) {
        pageDelegate?.nextPage(oldPage: self)
    }
    
}
