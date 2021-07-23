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
    
    
    var floatingLabel: UILabel = UILabel(frame: CGRect.zero) // Label
    var floatingLabelHeight: CGFloat = 14 // Default height
    @IBInspectable
    var _placeholder: String? // we cannot override 'placeholder'
    @IBInspectable
    var floatingLabelColor: UIColor = UIColor.black {
        didSet {
            self.floatingLabel.textColor = floatingLabelColor
            self.setNeedsDisplay()
        }
    }
    @IBInspectable
    var activeBorderColor: UIColor = UIColor.systemGray5
    @IBInspectable
    var floatingLabelFont: UIFont = UIFont.systemFont(ofSize: 19) {
        didSet {
            self.floatingLabel.font = self.floatingLabelFont
            self.font = self.floatingLabelFont
            self.setNeedsDisplay()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self._placeholder = (self._placeholder != nil) ? self._placeholder : placeholder // Use our custom placeholder if none is set
        placeholder = self._placeholder // make sure the placeholder is shown
        self.floatingLabel = UILabel(frame: CGRect.zero)
        self.addTarget(self, action: #selector(self.addFloatingLabel), for: .editingDidBegin)
        self.addTarget(self, action: #selector(self.removeFloatingLabel), for: .editingDidEnd)
    }
    
    
    
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
    
        @objc func addFloatingLabel() {
            if self.text == "" {
                self.floatingLabel.textColor = floatingLabelColor
                self.floatingLabel.font = floatingLabelFont
                self.floatingLabel.text = self._placeholder
                self.floatingLabel.layer.backgroundColor = UIColor.white.cgColor
                self.floatingLabel.translatesAutoresizingMaskIntoConstraints = false
                self.floatingLabel.clipsToBounds = true
                self.floatingLabel.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.floatingLabelHeight)
        self.layer.borderColor = self.activeBorderColor.cgColor
                self.addSubview(self.floatingLabel)
              
                self.floatingLabel.bottomAnchor.constraint(equalTo:
                self.topAnchor, constant: -10).isActive = true // Place our label 10pts above the text field
                // Remove the placeholder
                self.placeholder = ""
            }
            self.setNeedsDisplay()
        }
    
    
    
        @objc func removeFloatingLabel() {
            if self.text == "" {
                UIView.animate(withDuration: 0.13) {
                   self.subviews.forEach{ $0.removeFromSuperview() }
                   self.setNeedsDisplay()
                }
                self.placeholder = self._placeholder
            }
            self.layer.borderColor = UIColor.black.cgColor
        }
    
    
    
}
