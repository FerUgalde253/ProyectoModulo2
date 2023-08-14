//
//  SingUpModel.swift
//  ProyectoModulo2
//
//  Created by Fernando Ugalde on 13/08/23.
//

import Foundation

struct SingUpModel {
    var name: String
    var email: String
    var password: String

    var isValid: Bool {
        return !name.isEmpty && !email.isEmpty && !password.isEmpty
    }
}
