//
//  ViewController.swift
//  WTapp
//
//  Created by RSL on 20/12/21.
//

import UIKit
import SVProgressHUD

class ViewController: UIViewController {
    
    @IBOutlet weak var createAccountButton: WTCreateAccountButton!
    @IBOutlet weak var lbl_item: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*if let _ = UserDefaults.standard.string(forKey: UserDefaultKeys.logIn.rawValue)  {
            gotoDashBoard()
        } else {
            loginAPI()
        }*/
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupUI()
    }
    
    func setupUI() {
        createAccountButton.alighnTitleLabel()
        createAccountButton.createRoudRect()
        createAccountButton.createArrowlabel(aframe: createAccountButton.frame)
    }
    
    func gotoDashBoard() {
        print("Entered goto Dashboard")
    }
    
    func loginAPI() {
        SVProgressHUD.show()
        WTAuthenticationAPI().signInUserAPI(param: ["user":["email":"aj.sabeen@gmail.com","password":"qazplm123"]])
        { signIn, error in
            SVProgressHUD.dismiss()
            DispatchQueue.main.async {
                self.view.endEditing(true)
            }
            guard error == nil else {
                print("From main class Error",error?.message ?? "")
                return
            }
            guard let signIn = signIn else { return }
            if signIn.status == ServerStatus.Success.rawValue {
                //Save user detail in user default
                if !signIn.save() { return }
                UserDefaults.standard.set(signIn.authenticationToken, forKey: UserDefaultKeys.authToken.rawValue)
                UserDefaults.standard.set("logIn", forKey: UserDefaultKeys.logIn.rawValue)
            }
        }
    }
}

