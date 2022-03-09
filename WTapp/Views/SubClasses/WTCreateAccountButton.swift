//
//  WTCreateAccountButton.swift
//  WTapp
//
//  Created by RSL on 22/12/21.
//

import UIKit

class WTCreateAccountButton: UIButton {
    
    var arrowLabel:UILabel? = UILabel.init(frame: CGRect.zero)
    var labelFont:UIFont? = UIFont.init(name: "FontAwesome5Free-Solid", size: 17)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    convenience required init() {
        self.init(frame: CGRect.zero)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    func alighnTitleLabel() {
        self.titleLabel?.lineBreakMode = .byWordWrapping
        self.titleLabel?.numberOfLines = 0
        self.titleEdgeInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 80)
    }
    
    func createRoudRect() {
        self.layer.cornerRadius = 5
        self.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner, .layerMinXMinYCorner]
        self.layer.masksToBounds = true
    }
    
    func createArrowlabel(aframe:CGRect) {
        let aFrame:CGRect = CGRect(x: aframe.size.width - 75, y: (aframe.size.height/2) - 15, width: 60, height: 30)
        arrowLabel?.frame = aFrame
        arrowLabel?.font = labelFont
        arrowLabel?.text = ""
        arrowLabel?.textAlignment = .center
        arrowLabel?.backgroundColor = UIColor(red: 0.24, green: 0.24, blue: 0.24, alpha: 1.00)
        arrowLabel?.textColor = .white
        arrowLabel?.layer.cornerRadius = 15
        arrowLabel?.layer.masksToBounds = true
        self.addSubview(arrowLabel ?? UILabel.init())
    }
}
