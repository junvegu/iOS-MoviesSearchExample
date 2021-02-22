//
//  ModuleManager.swift
//  MOVSLogin
//
//  Created by Junior on 2/21/21.
//

import Foundation
import MOVSNetworking

public struct ModuleDependencies {
    let apiDataTransferService: DataTransferService
    
    public init (apiDataTransferService: DataTransferService) {
        self.apiDataTransferService = apiDataTransferService
    }
}

public struct Module {

    private let diContainer: DIContainer
    
    public init(dependencies: ModuleDependencies) {
        self.diContainer = DIContainer(dependencies: dependencies)
    }
    
    public func startMoviesSearchFlow(in navigationController: UINavigationController, mainVC: UIViewController) {
        let flow = diContainer.makeLoginCoordinator(navigationController: navigationController, mainVC: mainVC)
        flow.start()
    }
    
    public func startManApp() {
        
    }
}

public protocol ChatPresenter {
    func openChatForUser(inView: UIViewController)
}
