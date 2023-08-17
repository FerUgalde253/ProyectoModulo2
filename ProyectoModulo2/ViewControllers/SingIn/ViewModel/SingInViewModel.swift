//
//  SingInViewModel.swift
//  ProyectoModulo2
//
//  Created by Fernando Ugalde on 09/08/23.
//

import Foundation

class SingInViewModel: NSObject {
    private var userServise = UserService()
    
    var users: [User] = []
    
    func getUsers(){
        let request =  UserRequest(username: username, password: password)
    
        userServise.downloadUsers(request: request) { [weak self] result in
            switch result {
            case .success(let parsedData):
                DispatchQueue.main.async {
                    self?.users = parsedData.result
                    print(self?.users)
                }
            case .failure(let error):
                print("Error getting user: \(error)")
            }
        }
    }
    
    func containsUser(withName username: String, password: String) -> Bool {
        return users.contains { user in
            return user.username == username && user.password == password
        }
    }
    
    private var singInModel: SingInModel = SingInModel(username: "", password: "")
    
    
    var username: String {
        get { return singInModel.username}
        set { singInModel.username = newValue}
    }
    
    var password: String {
        get { return singInModel.password}
        set { singInModel.password = newValue}
    }
    
    var isValid: Bool {
        return singInModel.isValid
    }
}


