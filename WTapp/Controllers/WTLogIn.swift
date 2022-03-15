//
//  WTLogIn.swift
//  WTapp
//
//  Created by RSL on 15/03/22.
//

import UIKit

class WTLogIn: UIViewController {

    @IBOutlet weak var email: WTTextFieldStyling!
    @IBOutlet weak var password: WTTextFieldStyling!
    @IBOutlet weak var rememberMe: WTCheckBoxButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        SetupView()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func SetupView() {
        SetupTextStyling(email)
        SetupTextStyling(password)
        rememberMe.setupInitialization()
        self.reloadInputViews()
    }
    
    func SetupTextStyling(_ textField: WTTextFieldStyling) {
        textField.tintColor = self.view.tintColor
        textField.underlineNeeded = true
        textField.lineColour = UIColor(red: 0.59, green: 0.59, blue: 0.59, alpha: 1.0)
        textField.placeHolderColour = UIColor(red: 0.35, green: 0.35, blue: 0.35, alpha: 1.0)
        textField.setPlacehoderColor()
        textField.drawUnderLine()
    }

}
