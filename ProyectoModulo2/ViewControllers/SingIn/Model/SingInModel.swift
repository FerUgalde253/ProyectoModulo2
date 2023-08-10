//
//  Model.swift
//  ProyectoModulo2
//
//  Created by Fernando Ugalde on 09/08/23.
//

import Foundation


struct SinginModel {
    var email: String
    var password: String

    var isValid: Bool {
        return !email.isEmpty && !password.isEmpty
    }
}
