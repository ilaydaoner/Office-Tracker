//
//  FavoriteViewController.swift
//  Office Tracker
//
//  Created by Mac on 22.08.2022.
//

import UIKit
import CoreData


    class FavoriteViewController: UIViewController {

        @IBOutlet weak var nameLabel: UILabel!
        @IBOutlet weak var adressLabel: UILabel!
        @IBOutlet weak var capacityLabel: UILabel!
        @IBOutlet weak var roomsLabel: UILabel!
        @IBOutlet weak var officeImage: UIImageView!
        @IBOutlet weak var holderView: UIView!
        
        
        
        private lazy var persistentContainer: NSPersistentContainer = {
               NSPersistentContainer(name: "Office_Tracker")
           }()
        
        override func viewDidLoad() {
            super.viewDidLoad()

            persistentContainer.loadPersistentStores { [weak self] persistentStoreDescription, error in
                  if let error = error {
                      print("Unable to Add Persistent Store")
                      print("\(error), \(error.localizedDescription)")

                  } else {
                      self?.fetchFavorites()
                  }
              }
        }
        
        override func viewDidAppear(_ animated: Bool) {
            self.fetchFavorites()
        }
        
        private func fetchFavorites() {
            // Create Fetch Request
             let fetchRequest: NSFetchRequest<Favorites> = Favorites.fetchRequest()

             // Perform Fetch Request
             persistentContainer.viewContext.perform {
                 do {
                     // Execute Fetch Request
                     let result = try fetchRequest.execute()

                     self.nameLabel.text = result.last?.name
                     if let adressLabelText = result.last?.adress {
                         self.adressLabel.text = "Adres: \(adressLabelText)"
                     }
                     if let roomLabelText = result.last?.rooms {
                         self.roomsLabel.text = "Oda Sayısı: \(roomLabelText)"
                     }
                     if let capacityLabelText = result.last?.capacity {
                         self.capacityLabel.text = "Kapasite: \(capacityLabelText)"
                     }
                     
                     self.officeImage.image = Downloader.downloadImageWithURL(url: result.last?.officeImage ?? "")
                     



                 } catch {
                     print("Unable to Execute Fetch Request, \(error)")
                 }
             }
            
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let viewController = segue.destination as? DetailsViewController {
                viewController.managedObjectContext = persistentContainer.viewContext
            }
        }

    }

