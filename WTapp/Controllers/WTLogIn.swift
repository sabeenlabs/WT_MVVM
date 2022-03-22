//
//  WTLogIn.swift
//  WTapp
//
//  Created by RSL on 15/03/22.
//

import UIKit
import SVProgressHUD

class WTLogIn: UIViewController, UITextViewDelegate {

    @IBOutlet weak var email: WTTextFieldStyling!
    @IBOutlet weak var password: WTTextFieldStyling!
    @IBOutlet weak var rememberMe: WTCheckBoxButton!
    @IBOutlet weak var nextTapped: WTNextButton!
    @IBOutlet weak var backTapped:WTBackButton!
    @IBOutlet weak var Privacy: UITextView!
    
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
        nextTapped.createArrowlabel()
        backTapped.BackButtonWithTitle()
        backTapped.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        Privacy.delegate = self
        Privacy.isSelectable = true
        Privacy.dataDetectorTypes = .link
        Privacy.attributedText = Privacy.attributedText?.replace(placeholder: "Terms of Service", with: "Terms of Service", url: APIPath.terms, fontName: UIFont.init(name: "Avenir-Book", size: 15), isUnderLine: true)
        Privacy.attributedText = Privacy.attributedText?.replace(placeholder: "Privacy Policy", with: "Privacy Policy", url: APIPath.privacy, fontName: UIFont.init(name: "Avenir-Book", size: 15), isUnderLine: true)
        let attributesLink: [NSAttributedString.Key : Any] = [NSAttributedString.Key.foregroundColor: Privacy.textColor as Any,NSAttributedString.Key.underlineColor: Privacy.textColor as Any]
        Privacy.linkTextAttributes = attributesLink
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

    @objc func backAction() {
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK: - TextFieldDeligate
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        if URL.path == NSURL.init(string: APIPath.terms)?.path {
            let progressVC = WTTermsOfServiceController.loadFromNib()
            progressVC.modalPresentationStyle = .fullScreen
            self.present(progressVC, animated: true, completion: nil)
            return false
        } else if URL.path == NSURL.init(string: APIPath.privacy)?.path {
            let privacyVC = WTPrivacyPolicyController.loadFromNib()
            privacyVC.modalPresentationStyle = .fullScreen
            self.present(privacyVC , animated: true, completion: nil)
            return false
        }
        return true
    }
}
