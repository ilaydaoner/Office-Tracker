//
//  ViewController.swift
//  Office Tracker
//
//  Created by Mac on 5.07.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
let showVersion = (Bundle.main.infoDictionary?["SHOW_VERSION"] as? String) == "YES"
        if showVersion {
        } else {
    }
print("first")
    }
    
}


