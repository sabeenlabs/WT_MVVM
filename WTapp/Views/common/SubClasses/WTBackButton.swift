//
//  WTBackButton.swift
//  WTapp
//
//  Created by RSL on 17/03/22.
//

import UIKit

class WTBackButton: UIButton {
    
    var arrowLabel:UILabel? = UILabel.init(frame: CGRect.zero)
    var titleValue:UILabel? = UILabel.init(frame: CGRect.zero)
    var arrowFont:UIFont? = UIFont.init(name: "FontAwesome5Free-Solid", size: 28)
    var titleFont:UIFont? = UIFont.init(name: "Avenir-Black", size: 25)
    
    func BackButtonWithTitle() {
        self.setTitle("", for: .normal)
        var frameArrow = self.frame
        frameArrow.origin.x = (self.frame.width / 2) - 50
        frameArrow.origin.y = 0
        frameArrow.size.width = 50
        arrowLabel?.frame = frameArrow
        arrowLabel?.font = arrowFont
        arrowLabel?.text = ""
        arrowLabel?.textAlignment = .center
        arrowLabel?.textColor = .white
        self.addSubview(arrowLabel ?? UILabel.init())
        setupTitle()
    }
    
    func setupTitle() {
        var frameTitle = self.frame
        frameTitle.origin.x = (self.frame.width / 2) - 5
        frameTitle.origin.y = 0
        frameTitle.size.width = 60
        titleValue?.frame = frameTitle
        titleValue?.font = titleFont
        titleValue?.text = "Back"
        titleValue?.textAlignment = .left
        titleValue?.textColor = .white
        self.addSubview(titleValue ?? UILabel.init())
    }

    func BackButtonWithoutTitle() {
        
    }
}
