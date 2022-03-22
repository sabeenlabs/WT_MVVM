//
//  WTNextButton.swift
//  WTapp
//
//  Created by RSL on 17/03/22.
//

import UIKit

class WTNextButton: UIButton {
    var arrowLabel:UILabel? = UILabel.init(frame: CGRect.zero)
    var labelFont:UIFont? = UIFont.init(name: "FontAwesome5Free-Solid", size: 28)
    
    func createArrowlabel() {
        self.titleLabel?.text = ""
        arrowLabel?.frame = self.bounds
        arrowLabel?.font = labelFont
        arrowLabel?.text = ""
        arrowLabel?.textAlignment = .center
        arrowLabel?.backgroundColor = UIColor(red: 0.01, green: 0.69, blue: 0.87, alpha: 1.00)
        arrowLabel?.textColor = .white
        arrowLabel?.layer.cornerRadius = self.frame.size.height / 2
        arrowLabel?.layer.masksToBounds = true
        self.addSubview(arrowLabel ?? UILabel.init())
    }
}
