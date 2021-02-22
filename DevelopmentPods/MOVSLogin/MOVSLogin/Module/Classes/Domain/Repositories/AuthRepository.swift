//
//  AuthRepository.swift
//  MOVSLogin
//
//  Created by Junior on 2/21/21.
//

import Foundation

protocol AuthRepository {
    func login(withUsername: String, withPassword: String,completion: @escaping (Result<User, Error>) -> Void) -> Cancelable?
}
