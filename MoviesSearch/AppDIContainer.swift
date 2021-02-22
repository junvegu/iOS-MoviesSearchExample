//
//  AppLoginCoordinator.swift
//  MoviesSearch
//
//  Created by Junior on 2/21/21.
//

import Foundation
import MOVSAuthorization
import MOVSNetworking
import MOVSLogin
import MOVSMovies

final class AppDIContainer {
    
    
    // MARK: - Feature Modules
    func makeMoviesSearchModule() -> MOVSMovies.Module {
        let dependencies = MOVSMovies.ModuleDependencies(apiDataTransferService: apiDataTransferService,
                                                           imageDataTransferService: imageDataTransferService)
        return MOVSMovies.Module(dependencies: dependencies)
    }
    
    func makeLoginModule() -> MOVSLogin.Module {
        let dependencies = MOVSLogin.ModuleDependencies(apiDataTransferService: apiDataTransferService)
        return MOVSLogin.Module(dependencies: dependencies)
    }
   
    // MARK: - Network
    lazy var sessionManager = MOVSAuthorization(typeAuth: .bearer)
    
    lazy var apiDataTransferService: DataTransferService = {
        let config = MOVSNetworkingSettings(url: URL(string: Credentials.url)!,
                                          queryParameters: ["api_key": Credentials.apiKey,
                                                            "language": NSLocale.preferredLanguages.first ?? "es"])
        
        let apiDataNetwork = DefaultNetworkService(config: config, sessionManager: sessionManager)
        return DefaultDataTransferService(with: apiDataNetwork)
    }()
    lazy var imageDataTransferService: DataTransferService = {
        let config = MOVSNetworkingSettings(url: URL(string: Credentials.imagePathUrl)!)
        let imagesDataNetwork = DefaultNetworkService(config: config,
                                                      sessionManager: sessionManager)
        return DefaultDataTransferService(with: imagesDataNetwork)
    }()

}
// MARK: - Authentication conformance to Networking Service Protocols
extension AuthNetworkRequest: NetworkCancellable {}
extension MOVSAuthorization: NetworkSessionManager {
    public func request(_ request: URLRequest, completion: @escaping CompletionHandler) -> NetworkCancellable {
        return authRequest(request, completion: completion)
    }
}
