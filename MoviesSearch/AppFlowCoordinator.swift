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
        let loginVC = appDIContainer.makeLoginModule()
        let moviewVC = appDIContainer.makeMoviesSearchModule()
        loginVC.startMoviesSearchFlow(in: navigationController, mainVC: moviewVC.moduleScreenMovies(in: UINavigationController()) )
    }
    
    
}
