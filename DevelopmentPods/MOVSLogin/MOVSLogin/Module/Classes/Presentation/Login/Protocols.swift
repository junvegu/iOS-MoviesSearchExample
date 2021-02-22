//
//  Protocols.swift
//  MOVSLogin
//
//  Created by Junior on 2/21/21.
//

import Foundation

struct LoginViewProtocol {
    let loginSuccess: (User) -> Void
}
enum LoginViewModelLoading {
    case fullScreen
}

struct LoginItemViewModel: Equatable {
    let loginSuccess: Bool
    
}
protocol LoginViewModelInput {
    func viewDidLoad()
}

protocol LoginViewModelOutput {
    var isLoginSuccess: Observable<Bool> { get }
    var loading: Observable<LoginViewModelLoading?> { get }
    var error: Observable<String> { get }
    func login(username: String, password: String)
}

protocol LoginViewModel: LoginViewModelInput, LoginViewModelOutput {}
