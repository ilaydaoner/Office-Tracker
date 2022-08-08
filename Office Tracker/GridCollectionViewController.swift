//
//  GridCollectionViewController.swift
//  Office Tracker
//
//  Created by Mac on 8.08.2022.
//

import UIKit

class GridCollectionViewController: UICollectionViewController {

    private let reuseIdentifier = "Cell"
    
    static var officesForCollection: [Offices] = [Offices]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = .systemBackground
        collectionView!.register(UICollectionViewCell.self,
                                      forCellWithReuseIdentifier: reuseIdentifier)

            }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return GridCollectionViewController.officesForCollection.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        cell.backgroundColor = .white
        let office = GridCollectionViewController.officesForCollection[indexPath.row]
        let officeImage = Downloader.downloadImageWithURL(url: office.image ?? "")
        
        let imageView: UIImageView=UIImageView(frame: CGRect(x: 0, y: 0, width: (view.frame.size.width/3)-3, height: (view.frame.size.width/3)-3));

            imageView.image = officeImage

             cell.contentView.addSubview(imageView)
    
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        print("Did tap coll at position: \(indexPath.row)")
    }


}
