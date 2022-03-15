//
//  WTCheckBoxButton.swift
//  WTapp
//
//  Created by RSL on 15/03/22.
//

import UIKit

class WTCheckBoxButton: UIButton {
    
    var titleText: String? = ""
    
    func setupInitialization() {
        self.addTarget(self, action: #selector(detectAction), for: .touchUpInside)
        self.layer.cornerRadius = 3.0
        self.layer.masksToBounds = true
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor(red: 0.59, green: 0.59, blue: 0.59, alpha: 1.00).cgColor
    }
    
    func isChecked() -> Bool {
        if titleText == "" || (titleText == nil) {
            return false
        } else { return true }
    }
    
    @objc func detectAction() {
        if titleText == "" {
            titleText = ""
        } else { titleText = "" }
        self.setTitle(titleText, for: .normal)
    }
}
