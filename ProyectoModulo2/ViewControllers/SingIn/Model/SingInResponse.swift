//
//  SingInResponse.swift
//  ProyectoModulo2
//
//  Created by Fernando Ugalde on 15/08/23.
//

import Foundation

struct User: Codable {
    let username: String
    let password: String
    let age: Int
    
    enum CodingKeys: String, CodingKey {
        case username
        case password
        case age
    }
}

struct Users: Codable {
    let result: [User]
    
    enum CodingKeys: String, CodingKey {
        case result = "users"
    }
}
