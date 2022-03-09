//
//  WTArrowNextBlue.swift
//  WTapp
//
//  Created by RSL on 09/03/22.
//

import UIKit

class WTArrowNextBlue: UIButton {
    
    var arrowLabel:UILabel? = UILabel.init(frame: CGRect.zero)
    var labelFont:UIFont? = UIFont.init(name: "FontAwesome5Free-Solid", size: 17)
    var fillColour:UIColor? = UIColor(red: 0.33, green: 0.69, blue: 0.85, alpha: 1.00)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    convenience required init() {
        self.init(frame: CGRect.zero)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    func clearTitleLabel() {
        self.titleLabel?.text = ""
    }
    
    func createRoudRect() {
        self.layer.cornerRadius = 15
        self.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner, .layerMinXMinYCorner]
        self.layer.masksToBounds = true
    }
    
    func createArrowlabel() {
        let aFrame:CGRect = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        arrowLabel?.frame = aFrame
        arrowLabel?.font = labelFont
        arrowLabel?.text = ""
        arrowLabel?.textAlignment = .center
        arrowLabel?.backgroundColor = fillColour
        arrowLabel?.textColor = .white
        arrowLabel?.layer.cornerRadius = 15
        arrowLabel?.layer.masksToBounds = true
        self.addSubview(arrowLabel ?? UILabel.init())
    }
}
