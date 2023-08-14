//
//  SingUpViewModel.swift
//  ProyectoModulo2
//
//  Created by Fernando Ugalde on 13/08/23.
//

import Foundation

class SingUpViewModel {
    private var singUpModel: SingUpModel = SingUpModel(name: "", email: "", password: "")
    
    var name: String {
        get { return singUpModel.name }
        set { singUpModel.name = newValue}
    }
    
    var email: String {
        get { return singUpModel.email}
        set { singUpModel.email = newValue}
    }
    
    var password: String {
        get { return singUpModel.password}
        set { singUpModel.password = newValue}
    }
    
    var isValid: Bool {
        return singUpModel.isValid
    }
}
