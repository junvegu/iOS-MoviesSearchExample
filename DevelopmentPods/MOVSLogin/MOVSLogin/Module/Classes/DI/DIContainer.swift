//
//  DIContainer.swift
//  MOVSLogin
//
//  Created by Junior on 2/21/21.
//

import UIKit
import MOVSNetworking

final class DIContainer: LoginCoordinatorDependencies {


    
    private let dependencies: ModuleDependencies

    // MARK: - Persistent Storage
    
    init(dependencies: ModuleDependencies) {
        self.dependencies = dependencies
    }
    
    // MARK: - Use Cases

    
    func injectAuthRepository() -> AuthRepository {
        return AuthRemoteRepository(dataTransferService: dependencies.apiDataTransferService)
    }
    
    func makeAuthUseCase() -> AuthUseCase {
        return AuthUseCaseImp(authRepository: injectAuthRepository())
    }
    
    func makeLoginViewModel(actions: LoginViewProtocol) -> LoginViewModel {
        return DefaultLoginViewModel(authUseCase: makeAuthUseCase(),view: actions)
    }
    // MARK: - Movies List
    func makeLoginViewController(actions: LoginViewProtocol) -> LoginViewController? {
        return LoginViewController.create(with: makeLoginViewModel(actions: actions))

    }
    func makeLoginCoordinator(navigationController: UINavigationController, mainVC: UIViewController) -> LoginCoordinator {
        return LoginCoordinator(navigationController: navigationController, dependencies: self, mainVC: mainVC)
    }
 
    
}
