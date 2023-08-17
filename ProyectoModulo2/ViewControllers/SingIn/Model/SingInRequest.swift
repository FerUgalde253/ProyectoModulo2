//
//  SingInRequest.swift
//  ProyectoModulo2
//
//  Created by Fernando Ugalde on 15/08/23.
//

import Foundation

struct UserRequest: Codable{
    let username: String
    let password: String
    
    enum CodingKeys: String, CodingKey {
        case username
        case password
    }
}
