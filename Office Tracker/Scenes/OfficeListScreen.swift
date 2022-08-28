//
//  OfficeListScreen.swift
//  Office Tracker
//
//  Created by Mac on 8.08.2022.
//

import Foundation
import UIKit

class OfficeListScreen: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    var offices: [Offices] = [] {
       didSet {
           DispatchQueue.main.async {
               self.tableView.reloadData()
           }
       }
   }
    var capacityOfOffices = [String]()
    
    var roomsOfOffices = [String]()
   
   override func viewDidLoad() {
       super.viewDidLoad()
       tableView.delegate = self
       tableView.dataSource = self
       tableView.rowHeight = 80
       get { (userData) in
           self.offices = userData
           
           for i in self.offices {
               self.capacityOfOffices.append(i.capacity ?? "")
               self.roomsOfOffices.append("\(i.rooms)" ?? "")
           }
       }
   }
   
   func get(completion: @escaping ((_ user: [Offices]) -> Void) ) {
       let url = URL(string: "https://officer-ad6ef-default-rtdb.firebaseio.com/offices.json")!
       URLSession.shared.dataTask(with: url) { data, response, error in
           guard let data = data else { return }
           do {
               let userData = try JSONDecoder().decode(Array<Offices>.self, from: data)

              
               
               completion(userData)
           } catch {
               print("Error \(error)")
           }
       }.resume()
   }
    
    @IBAction func didTapScreen(_ sender: UIButton) {
    let pickerVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PickerScreen") as! PickerViewController
        
        pickerVC.capacityFilter = capacityOfOffices
        pickerVC.roomFilter = roomsOfOffices
        navigationController?.pushViewController(pickerVC, animated: true)
      
    }
   
    @IBAction func mapButton(_ sender: UIButton) {
    }
    
}


extension OfficeListScreen: UITableViewDataSource, UITableViewDelegate {
   
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return offices.count
   }
   
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "officeCell") as? OfficeCell
       let office = offices[indexPath.row]
       cell?.officeTitleLabel.text = office.name
       cell?.tintColor = .black
      
       let officeImage = Downloader.downloadImageWithURL(url: office.image ?? "")
       cell?.officeImageView.image = officeImage
       
       return cell ?? UITableViewCell()
   }
   
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let office = offices[indexPath.row]
       let officeImage = Downloader.downloadImageWithURL(url: office.image ?? "")
       let detailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailScreen") as! DetailsViewController
       detailVC.adress = office.address ?? ""
       detailVC.capacity = office.capacity ?? ""
       detailVC.rooms = office.rooms ?? 0
       detailVC.officeName = office.name ?? ""
       detailVC.officeImg.image = officeImage
       GridCollectionViewController.officesForCollection = offices
       navigationController?.pushViewController(detailVC, animated: true)
//        self.present(detailVC, animated: true, completion: nil)
   }
}


