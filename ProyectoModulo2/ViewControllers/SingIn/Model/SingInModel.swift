//
//  SingInModel.swift
//  ProyectoModulo2
//
//  Created by Fernando Ugalde on 15/08/23.
//

import Foundation

struct SingInModel {
    var username: String
    var password: String

    var isValid: Bool {
        return !username.isEmpty && !password.isEmpty
    }
}
