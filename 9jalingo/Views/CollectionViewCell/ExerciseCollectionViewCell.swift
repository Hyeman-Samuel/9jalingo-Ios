//
//  ExerciseCollectionViewCell.swift
//  9jalingo
//
//  Created by Samuel Hyeman on 18/07/2021.
//

import UIKit

class ExerciseCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var background: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        background.layer.cornerRadius = 30
    }

}
