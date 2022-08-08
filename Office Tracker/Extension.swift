//
//  Extension.swift
//  Office Tracker
//
//  Created by Mac on 8.08.2022.
//

import Foundation
import UIKit

class Downloader {
    
    class func downloadImageWithURL(url: String) -> UIImage! {
        
        let date = NSData(contentsOf: URL(string: url)!)
        return UIImage(data: date! as Data)
    }
}
