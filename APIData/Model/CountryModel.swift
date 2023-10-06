//
//  CountryModel.swift
//  APIData
//
//  Created by Apoorva Kanekal on 10/5/23.
//

import Foundation
import SwiftUI

struct Country: Codable, Identifiable {
    var id: Int { return UUID().hashValue}
    var name: Name
    var region: String
    var population: Int
    var flag: String
    var flags: Flag
    var coatOfArms: CoatOfArms?
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
