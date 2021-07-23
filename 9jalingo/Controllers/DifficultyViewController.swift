//
//  DifficultyViewController.swift
//  9jalingo
//
//  Created by Samuel Hyeman on 20/07/2021.
//

import UIKit

class DifficultyViewController: UIViewController {

    @IBOutlet weak var options: UICollectionView!
    @IBOutlet weak var submitButton: UIButton!
    private let optionsVerticalayout : UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    static let optionsListCellIdentifier = "options"
    override func viewDidLoad() {
        super.viewDidLoad()
        options.register(UINib(nibName: "OptionCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: Self.optionsListCellIdentifier)
        optionsVerticalayout.scrollDirection = .vertical
        optionsVerticalayout.sectionHeadersPinToVisibleBounds = true
        options.backgroundColor = .clear
        options.collectionViewLayout = optionsVerticalayout
        options.delegate = self
        options.dataSource = self
        options.backgroundColor = UIColor.clear
        submitButton.layer.cornerRadius = submitButton.frame.height/2
        // Do any additional setup after loading the view.
    }
    

    @IBAction func backButtonPressed(_ sender: Any) {
    }
    
     @IBAction func submitButtonPressed(_ sender: Any) {
        
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

extension DifficultyViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Self.optionsListCellIdentifier, for: indexPath) as? OptionCollectionViewCell else {
                    fatalError("Unable to dequeu ReminderCell")
                }
                return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let autoLayout = collectionViewLayout as! UICollectionViewFlowLayout
        autoLayout.minimumInteritemSpacing = 0
               let column : CGFloat = 1
                let padding:CGFloat = 20
               let collectionWidth = collectionView.bounds.width
               let spacing = autoLayout.minimumInteritemSpacing * (column - 1);
               let adjustedWidth = floor(collectionWidth - spacing - padding)
               let width = adjustedWidth / column
               let height = width * 0.3
       
       
               return CGSize(width: width , height: height)
    }
}
