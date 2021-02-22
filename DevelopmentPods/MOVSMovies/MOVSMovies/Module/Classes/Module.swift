//
//  MoviesSearchModule.swift
//  MOVSMovies
//
//  Created by Junior on 2/21/21.
//

import UIKit
import MOVSNetworking

public struct ModuleDependencies {
    let apiDataTransferService: DataTransferService
    let imageDataTransferService: DataTransferService
    
    public init (apiDataTransferService: DataTransferService, imageDataTransferService: DataTransferService) {
        self.apiDataTransferService = apiDataTransferService
        self.imageDataTransferService = imageDataTransferService
    }
}

public struct Module {

    private let diContainer: DIContainer
    
    public init(dependencies: ModuleDependencies) {
        self.diContainer = DIContainer(dependencies: dependencies)
    }
    
    public func startMoviesSearchFlow(in navigationController: UINavigationController) {
        let flow = diContainer.makeMoviesSearchFlowCoordinator(navigationController: navigationController)
        let vc = flow.coordinateMovies()
        navigationController.present(vc, animated: true, completion: nil)
    }
    
    public func moduleScreenMovies(in navigationController: UINavigationController) -> UIViewController {
        let flow = diContainer.makeMoviesSearchFlowCoordinator(navigationController: navigationController)
        let vc = flow.coordinateMovies()
        return vc
    }
}

// Note: We can create ChatPresenter Interface and add it to ModuleDependencies if we want to delegate
// Chat feature to App and avoid dependency on Chat module from this module(same can be done by using closure)
public protocol ChatPresenter {
    func openChatForUser(inView: UIViewController)
}
