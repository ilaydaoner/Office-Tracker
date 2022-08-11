//
//  PhotoViewController.swift
//  Office Tracker
//
//  Created by Mac on 10.08.2022.
//

import UIKit

class PhotosViewController: UIViewController {

    
    
    @IBOutlet weak var PhotosImage: UIImageView!
    
    var selectedPhotos = UIImageView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        PhotosImage.image = selectedPhotos.image
    }
    @IBAction func closeButton(_ sender: UIButton) {
    }
    
    }
