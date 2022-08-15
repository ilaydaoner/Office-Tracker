//
//  OfficeModels.swift
//  Office Tracker
//
//  Created by Mac on 8.08.2022.
//

import Foundation
import UIKit

struct Offices: Codable {
    let address: String?
    let capacity: String?
    let id: Int?
    let image: String?
    let images: [String]?
    let location: Location?
    let name: String?
    let rooms: Int?
    let space: String?
}


struct Location: Codable {
    let latitude, longitude: Double?
}
