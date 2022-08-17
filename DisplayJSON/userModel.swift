//
//  userModel.swift
//  DisplayJSON
//
//  Created by Ram Balaji Koppula on 16/08/22.
//


import SwiftUI

struct JSONData: Codable {
    var employees: [User]
}

struct User: Codable {
    var name: String
    var age: Int
    var salary: Int
}
