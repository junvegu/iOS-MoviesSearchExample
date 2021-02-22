//
//  AuthUseCase.swift
//  MOVSLogin
//
//  Created by Junior on 2/21/21.
//

import Foundation

protocol AuthUseCase {
    func execute(requestValue: AuthUserCaseRequestValue,
                 completion: @escaping (Result<User, Error>) -> Void) -> Cancelable?
}


class AuthUseCaseImp: AuthUseCase {
    private let authRepository: AuthRepository

    init(authRepository: AuthRepository) {
        self.authRepository = authRepository
    }
    
    func execute(requestValue: AuthUserCaseRequestValue, completion: @escaping (Result<User, Error>) -> Void) -> Cancelable? {
        return authRepository.login(withUsername: requestValue.username, withPassword: requestValue.passowrd) { (result) in
            completion(result)
        }
    }
}

struct AuthUserCaseRequestValue {
    let username: String
    let passowrd: String
}
