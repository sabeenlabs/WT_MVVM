//
//  ViewController.swift
//  WTapp
//
//  Created by RSL on 20/12/21.
//

import UIKit
import SVProgressHUD

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextViewDelegate {
    
    @IBOutlet weak var welcomeTable: UITableView!
    @IBOutlet weak var createAccountButton: WTCreateAccountButton!
    @IBOutlet weak var signIn: UITextView!
    @IBOutlet weak var privacy: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeTable.dataSource = self
        welcomeTable.delegate = self
        setAttibuteLink()
        /*if let _ = UserDefaults.standard.string(forKey: UserDefaultKeys.logIn.rawValue)  {
            gotoDashBoard()
        } else {
            loginAPI()
        }*/
    }
    
    func setAttibuteLink() {
        signIn.delegate = self
        signIn.isSelectable = true
        signIn.dataDetectorTypes = .link
        signIn.attributedText = signIn.attributedText?
            .replace(placeholder: "Sign in", with: "Sign in", url: APIPath.SignIn, fontName: UIFont.init(name: "Avenir-Black", size: 20.0))
        let linkAttributes: [NSAttributedString.Key : Any] = [NSAttributedString.Key.foregroundColor: UIColor(red: 0.15, green: 0.69, blue: 0.87, alpha: 1.00)]
        signIn.linkTextAttributes = linkAttributes
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
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
    
    //MARK: - Tableview Datasource/Deligate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "\(indexPath.row)") as? welcomeCell
        if cell == nil{
            tableView.register(UINib.init(nibName: "welcomeCell", bundle: nil), forCellReuseIdentifier: "welcomeCell")
            let arrNib = Bundle.main.loadNibNamed("welcomeCell",owner: self, options: nil)!
            cell = arrNib[0] as? welcomeCell
        }
        cell?.selectionStyle = .none
        cell?.setupCell()
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    //MARK: - TextFieldDeligate
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        if URL.path == NSURL.init(string: APIPath.SignIn)?.path {
            self.performSegue(withIdentifier: "gotoSignIn", sender: nil)
            return false
        }
        return true
    }
}

