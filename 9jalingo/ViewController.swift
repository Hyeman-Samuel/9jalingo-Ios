//
//  ViewController.swift
//  9jalingo
//
//  Created by Samuel Hyeman on 17/07/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var NavBar: UIView!
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var exercises: UICollectionView!
    private let exerciseVerticalayout : UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    static let exerciseListCellIdentifier = "exercise"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        exercises.register(UINib(nibName: "ExerciseCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: Self.exerciseListCellIdentifier)
        NavBar.layer.cornerRadius = 60;
        avatar.layer.cornerRadius = avatar.frame.height / 2;
        exerciseVerticalayout.scrollDirection = .vertical
        exerciseVerticalayout.sectionHeadersPinToVisibleBounds = true
        exercises.backgroundColor = .clear
        exercises.collectionViewLayout = exerciseVerticalayout
        exercises.delegate = self
        exercises.dataSource = self
        exercises.backgroundColor = UIColor.clear
    }


}


extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Self.exerciseListCellIdentifier, for: indexPath) as? ExerciseCollectionViewCell else {
                    fatalError("Unable to dequeue ReminderCell")
                }
                return cell
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
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    
}

