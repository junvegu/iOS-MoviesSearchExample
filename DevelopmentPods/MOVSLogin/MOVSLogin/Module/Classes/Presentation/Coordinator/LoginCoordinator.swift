//
//  LoginCoordinator.swift
//  MOVSLogin
//
//  Created by Junior on 2/21/21.
//

import Foundation
import UIKit

protocol LoginCoordinatorDependencies  {
    func makeLoginViewController(actions: LoginViewProtocol) -> LoginViewController?
}

final class LoginCoordinator {
    
    private weak var navigationController: UINavigationController?
    private let dependencies: LoginCoordinatorDependencies
    
    private weak var loginVC : LoginViewController?
    
    init(navigationController: UINavigationController,
         dependencies: LoginCoordinatorDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    func start() {
        let actionsLogin = LoginViewProtocol.init(loginSuccess: showMoviesSearch)
        if  let vc = dependencies.makeLoginViewController(actions: actionsLogin) {
            loginVC = vc
            self.navigationController?.setViewControllers([vc], animated: true)
        }
       
    }
    
    private func showMoviesSearch(user: User) {
        let vc = UIViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    

}
