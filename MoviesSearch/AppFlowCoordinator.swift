//
//  AppFlowCoordinator.swift
//  MoviesSearch
//
//  Created by Junior on 2/21/21.
//

import UIKit

final class AppFlowCoordinator {

    private weak var navigationController: UINavigationController?
    private let appDIContainer: AppDIContainer
    
    init(navigationController: UINavigationController,
         appDIContainer: AppDIContainer) {
        self.navigationController = navigationController
        self.appDIContainer = appDIContainer
    }
    
    func start() {
        guard let navigationController = navigationController else { return }

        // In App Flow we can check if user needs to login, if yes we would run login flow
        let loginVC = appDIContainer.makeLoginModule()
        loginVC.startMoviesSearchFlow(in: navigationController)
    }
}
