//
//  DetailsViewController.swift
//  Office Tracker
//
//  Created by Mac on 8.08.2022.
//

import UIKit

import CoreData

class DetailsViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var adressLabel: UILabel!
    @IBOutlet weak var capacityLabel: UILabel!
    @IBOutlet weak var roomsLabel: UILabel!
    @IBOutlet weak var officeImage: UIImageView!
    @IBOutlet weak var holderView: UIView!
    @IBOutlet weak var favoriteButton: UIButton!
    
    var adress = String()
    var capacity = String()
    var rooms = Int()
    var officeName = String()
    var officeImg = UIImageView()
    var officeImageUrl = String()
    
    private lazy var persistentContainer: NSPersistentContainer = {
           NSPersistentContainer(name: "Office_Tracker")
       }()
    
    var managedObjectContext: NSManagedObjectContext?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favoriteButton.layer.cornerRadius = 8
        holderView.layer.cornerRadius = 22
        adressLabel.text = "Adres: \(adress)"
        roomsLabel.text = "Oda Sayısı: \(String(rooms))"
        capacityLabel.text = "Kapasite: \(capacity)"
        nameLabel.text = officeName
        officeImage.image = officeImg.image
        
    
    }
    
    @IBAction func addFavorite(_ sender: Any) {
        
        guard let appDelegate =
           UIApplication.shared.delegate as? AppDelegate else {
           return
         }
         
         // 1
         let managedContext =
           appDelegate.persistentContainer.viewContext
        

        
//        Create Office
        let office = Favorites(context: managedContext)
        office.name = self.officeName
        office.capacity = self.capacity
        office.rooms = String(self.rooms)
        office.adress = self.adress
        office.officeImage = self.officeImageUrl
        
        do {
              // Save office to Persistent Store
              try managedContext.save()

              // Dismiss View Controller
//              dismiss(animated: true)
          } catch {
              print("Unable to Save Offices, \(error)")
          }
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


