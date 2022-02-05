//
//  DataModel.swift
//  IOS_WEEK4
//
//  Created by 홍희수 on 2022/02/05.
//

import Foundation

// MARK: - Welcome
struct DataModel: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: Person
}

// MARK: - DataClass
struct Person: Codable {
    let username, name: String
    
    enum CodingKeys: String, CodingKey {
        case username
        case name
    }
}
