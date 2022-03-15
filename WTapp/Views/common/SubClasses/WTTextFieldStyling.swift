//
//  WTTextFieldStyling.swift
//  WTapp
//
//  Created by RSL on 15/03/22.
//

import UIKit

class WTTextFieldStyling: UITextField {
    
    var underLineView: UIView? = UIView.init(frame: CGRect.zero)
    var underlineNeeded: Bool? = false
    var lineColour: UIColor?
    var placeHolderColour: UIColor?
    
    func setPlacehoderColor() {
        let paragraphStyle: NSMutableParagraphStyle = NSMutableParagraphStyle.init()
        paragraphStyle.alignment = self.textAlignment
        let placeholderAttributes = [NSAttributedString.Key.font: self.font, NSAttributedString.Key.foregroundColor:placeHolderColour,NSAttributedString.Key.paragraphStyle:paragraphStyle]
        let attributedPlaceholder: NSAttributedString = NSAttributedString.init(string: self.placeholder ?? "", attributes: placeholderAttributes as [NSAttributedString.Key : Any])
        self.attributedPlaceholder = attributedPlaceholder
    }
    
    func drawUnderLine() {
        if (underLineView != nil) {
            underLineView?.removeFromSuperview()
        }
        if underlineNeeded ?? false {
            underLineView = UIView.init(frame: CGRect(x: 0, y: self.frame.height - 1, width: self.frame.width, height: 2))
            underLineView?.autoresizingMask = .flexibleWidth;
            underLineView?.backgroundColor = lineColour;
            self.addSubview(underLineView ?? UIView.init())
        }
    }
}
