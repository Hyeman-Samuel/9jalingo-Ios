//
//  CongratulatoryViewController.swift
//  9jalingo
//
//  Created by Samuel Hyeman on 23/07/2021.
//

import UIKit

class CongratulatoryViewController: UIViewController {

    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    private let display = GifDisplay()
    override func viewDidLoad() {
        super.viewDidLoad()
        display.displayGif(imageView: imageView, name: "celebration")
        continueButton.layer.cornerRadius = continueButton.frame.height/2
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

    @IBAction func continueBtnPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
          // Instantiate View Controller
        let viewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! ViewController
        viewController.modalTransitionStyle = .flipHorizontal
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true, completion: nil)
    }
}
