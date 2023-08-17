//
//  SingInService.swift
//  ProyectoModulo2
//
//  Created by Fernando Ugalde on 15/08/23.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
}


class UserService {
    func downloadUsers(request: UserRequest, completion: @escaping (Result<Users,Error>) -> Void) {
        let urlSession = URLSession(configuration: .default)
        let urlString = "https://dummyjson.com/users"
        guard let url = URL(string: urlString)else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        let urlRequest = URLRequest(url: url)
        let dataTask = urlSession.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else{
                completion(.failure(NetworkError.noData))
                return
            }
            do{
                let jsonDecoder = JSONDecoder()
                let parsedData = try jsonDecoder.decode(Users.self, from: data)
                completion(.success(parsedData))
                //print(parsedData)
            } catch {
                completion(.failure(error))
            }
        }
        dataTask.resume()
    }

}


