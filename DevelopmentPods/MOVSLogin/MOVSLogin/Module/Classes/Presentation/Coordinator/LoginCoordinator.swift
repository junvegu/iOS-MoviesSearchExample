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
    private let navigationMain: UIViewController
    private weak var loginVC : LoginViewController?
    
    init(navigationController: UINavigationController,
         dependencies: LoginCoordinatorDependencies,
         mainVC: UIViewController) {
        self.navigationController = navigationController
        self.dependencies = dependencies
        self.navigationMain = mainVC
    }
    
    func start() {
        let actionsLogin = LoginViewProtocol.init(loginSuccess: showMoviesSearch)
        if  let vc = dependencies.makeLoginViewController(actions: actionsLogin) {
            loginVC = vc
            self.navigationController?.setViewControllers([vc], animated: true)
        }
       
    }
    
    func showMoviesSearch(user: User) {
        navigationMain.modalPresentationStyle = .fullScreen
        navigationController?.present(navigationMain, animated: true, completion: nil)
    }
    

}
