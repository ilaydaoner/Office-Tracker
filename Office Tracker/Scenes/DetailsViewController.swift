//
//  DetailsViewController.swift
//  Office Tracker
//
//  Created by Mac on 8.08.2022.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var adressLabel: UILabel!
    @IBOutlet weak var capacityLabel: UILabel!
    @IBOutlet weak var roomsLabel: UILabel!
    @IBOutlet weak var officeImage: UIImageView!
    @IBOutlet weak var holderView: UIView!
    var adress = String()
    var capacity = String()
    var rooms = Int()
    var officeName = String()
    var officeImg = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        holderView.layer.cornerRadius = 22
        adressLabel.text = "Adres: \(adress)"
        roomsLabel.text = "Oda Sayısı: \(String(rooms))"
        capacityLabel.text = "Kapasite: \(capacity)"
        nameLabel.text = officeName
        officeImage.image = officeImg.image
    }

        @IBAction func morePhotoButton(_ sender: UIButton) {
        let layout = UICollectionViewFlowLayout()
    layout.itemSize = CGSize(width: (view.frame.size.width/3)-3, height: (view.frame.size.width/3)-3)
    layout.minimumLineSpacing = 1
    layout.scrollDirection = .vertical
    layout.sectionInset = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
    layout.minimumInteritemSpacing = 1
    
    let vc = GridCollectionViewController(collectionViewLayout: layout)
    vc.title = "Fotoğraflar"
    vc.navigationItem.largeTitleDisplayMode = .always
    
    let navVc = UINavigationController(rootViewController: vc)
    navVc.navigationBar.prefersLargeTitles = true
    
    present(navVc, animated:true)
}
}

