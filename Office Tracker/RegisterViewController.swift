//
//  RegisterViewController.swift
//  Office Tracker
//
//  Created by Mac on 27.07.2022.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var lastnameLabel: UILabel!
    @IBOutlet weak var lastnameField: UITextField!
    
    @IBOutlet weak var createButton: UIButton!
    @IBOutlet weak var firstnameField: UITextField!
    
    @IBOutlet weak var firstnameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        createButton.layer.cornerRadius = 15
        firstnameLabel.textColor = UIColor(named: "purpletoDark")
        lastnameLabel.textColor = UIColor(named: "purpletoDark")
        emailLabel.textColor = UIColor(named: "purpletoDark")
        passwordLabel.textColor = UIColor(named: "purpletoDark")
        createButton.backgroundColor = UIColor(named: "purpletoDark")
        
        
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func createTap(_ sender: Any) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
