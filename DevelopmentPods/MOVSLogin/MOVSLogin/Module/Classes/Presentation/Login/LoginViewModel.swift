//
//  LoginViewModel.swift
//  MOVSLogin
//
//  Created by Junior on 2/21/21.
//

import Foundation

class DefaultLoginViewModel: LoginViewModel {

    private let authUseCase: AuthUseCase
    private let view: LoginViewProtocol?
    private var loginLoadTask: Cancelable? { willSet { loginLoadTask?.cancel() } }

    let isLoginSuccess: Observable<Bool> = Observable(false)
    let error: Observable<String> = Observable("")
    let loading: Observable<LoginViewModelLoading?> = Observable(.none)
    var user: User?
    
    init(authUseCase: AuthUseCase,
         view: LoginViewProtocol? = nil) {
        self.authUseCase = authUseCase
        self.view = view
    }
    
    func login(username: String, password: String) {
       
        if !validationInputsFromLogin(username, password) {
            return
        }
        loading.value = .fullScreen
        loginLoadTask = authUseCase.execute(requestValue: .init(username: username, passowrd: password), completion: { (result) in
            switch result {
            case .success(let user):
                self.isLoginSuccess.value = true
                self.user = user
            case .failure(let error):
                self.handle(error: error)
            }
            self.loading.value = .none

        })
    }
    
    private func validationInputsFromLogin(_ username: String,_ password: String) -> Bool{
        self.error.value = ""

        if username.isEmpty && password.isEmpty {
            self.error.value = "Debe ingresar su usuario y contraseña"
            return false
        }
        
        if username.isEmpty {
            self.error.value = "Debe ingresar su usuario"
            return false
        }
        
        if password.isEmpty {
            self.error.value = "Debe ingresar su contraseñna"
            return false
        }
        
        return true
    }
    
    private func handle(error: Error) {
        self.error.value = error.isInternetConnectionError ? "Revise su conexiǿn a internet" : "Error al ingresar las credenciales"
    }
}

extension DefaultLoginViewModel {

    func viewDidLoad() { }

}
