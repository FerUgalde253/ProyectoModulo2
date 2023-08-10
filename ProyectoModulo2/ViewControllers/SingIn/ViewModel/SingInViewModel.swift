//
//  SingInViewModel.swift
//  ProyectoModulo2
//
//  Created by Fernando Ugalde on 09/08/23.
//

import Foundation

class SingInViewModel {
    private var singInModel: SinginModel = SinginModel(email: "", password: "")
    
    var email: String {
        get { return singInModel.email}
        set { singInModel.email = newValue}
    }
    
    var password: String {
        get { return singInModel.password}
        set { singInModel.password = newValue}
    }
    
    var isValid: Bool {
        return singInModel.isValid
    }
}
