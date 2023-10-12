//
//  CountryModel.swift
//  APIData
//
//  Created by Apoorva Kanekal on 10/5/23.
//

import Foundation
import SwiftUI
import MapKit

struct Country: Codable, Identifiable {
    var id: Int { return UUID().hashValue}
    var name: Name
    var region: String
    var population: Int
    var flag: String
    var flags: Flag
    var coatOfArms: CoatOfArms?
    var capitalInfo: CapitalInfo
}

struct Name: Codable{
    var common: String
}

struct Flag: Codable{
    var png: String
}

struct CoatOfArms: Codable{
    var png: String?
}

struct CapitalInfo: Codable {
    var latlng: [Double]?
    
    var coordinate: CLLocationCoordinate2D? {
        guard let latlng, latlng.count >= 2 else { return nil }
        return CLLocationCoordinate2D(latitude: latlng[0], longitude: latlng[1])
    }
}
