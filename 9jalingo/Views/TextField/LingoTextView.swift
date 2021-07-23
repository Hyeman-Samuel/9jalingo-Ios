//
//  LingoTextView.swift
//  9jalingo
//
//  Created by Samuel Hyeman on 21/07/2021.
//

import UIKit



class LingoTextView: UITextField {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var textPadding = UIEdgeInsets(
           top: 10,
           left: 20,
           bottom: 10,
           right: 20
       )

   
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
            let rect = super.textRect(forBounds: bounds)
            return rect.inset(by: textPadding)
        }

        override func editingRect(forBounds bounds: CGRect) -> CGRect {
            let rect = super.editingRect(forBounds: bounds)
            return rect.inset(by: textPadding)
        }

}

extension LingoTextView{
    
    func setCorner(radius: CGFloat) {
            layer.cornerRadius = radius
            clipsToBounds = true
        }
    
    func circleCorner() {
            superview?.layoutIfNeeded()
            setCorner(radius: frame.height / 2)
        }
    
   
        func setBorder(width: CGFloat, color: UIColor) {
            layer.borderColor = color.cgColor
            layer.borderWidth = width
        }
    
    
}
