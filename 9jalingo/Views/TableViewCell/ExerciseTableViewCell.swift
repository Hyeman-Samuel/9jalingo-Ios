//
//  TableViewCell.swift
//  9jalingo
//
//  Created by Samuel Hyeman on 18/07/2021.
//

import UIKit

class ExerciseTableViewCell: UICollectionViewCell {

    @IBOutlet weak var exerciseAvatar: UIImageView!
    @IBOutlet weak var exerciseTitle: UILabel!
    @IBOutlet weak var exerciseProgress: UIProgressView!
    @IBOutlet weak var exercisePercentage: UILabel!
    @IBOutlet weak var background: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = .clear
        background.layer.cornerRadius = 70
        exerciseAvatar.layer.cornerRadius = exerciseAvatar.frame.width/2
    }

    
}
