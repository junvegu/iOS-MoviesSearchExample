//
//  AuthRepository.swift
//  MOVSLogin
//
//  Created by Junior on 2/21/21.
//

import Foundation
import MOVSNetworking

class AuthRemoteRepository: AuthRepository {

    private let defaultUsername: String = "Admin"
    private let defaultPassword: String = "Password*123"
    
    private let dataTransferService: DataTransferService
    init(dataTransferService: DataTransferService) {
        self.dataTransferService = dataTransferService
    }
    
    func login(withUsername: String, withPassword: String, completion: @escaping (Result<User, Error>) -> Void) -> Cancelable? {

        if defaultUsername == withUsername && defaultPassword == withPassword {
            let response = UserEntity.init(first_name: "Junior", last_name: "Quevedo")
            completion(.success(response.mapToDomainModel()))
        } else {
            completion(.failure(NSError(domain: "AuthUser", code: 401, userInfo: nil)))

        }
        
        return nil
    }
    
    
}
