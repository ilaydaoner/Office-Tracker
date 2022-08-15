//
//  ViewController.swift
//  Office Tracker
//
//  Created by Mac on 5.07.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var doyouhaveLabel: UILabel!
    @IBOutlet weak var signinButton: UIButton!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var passwordLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        let showVersion = (Bundle.main.infoDictionary?["SHOW_VERSION"] as? String) == "YES"
                if showVersion {
                } else {
            }
    }
    private func setupUI() {
        signinButton.layer.cornerRadius = 15
        registerButton.layer.cornerRadius = 15
        emailLabel.textColor = UIColor(named: "purpletoDark")
        signinButton.setTitleColor(UIColor(named: "whitetoDark"), for: .normal)
        registerButton.setTitleColor(UIColor(named: "whitetoDark"), for: .normal)
        
        passwordLabel.textColor = UIColor(named: "purpletoDark")
        signinButton.backgroundColor = UIColor(named: "purpletoDark")
        registerButton.backgroundColor = UIColor(named: "purpletoDark")
        emailField.layer.borderColor = UIColor(named: "borderPrimeColor")?.cgColor
        passwordField.layer.borderColor = UIColor(named: "borderPrimeColor")?.cgColor
        emailField.layer.borderWidth = 1.3
        passwordField.layer.borderWidth = 1.3
       
        
        
    }
        
        
        // Do any additional setup after loading the view.
    


    
    @IBAction func signinTap(_ sender: UIButton) {
    }
}


