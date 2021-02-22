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

final class AppDIContainer {
    
    
    // MARK: - Feature Modules
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

}
// MARK: - Authentication conformance to Networking Service Protocols
extension AuthNetworkRequest: NetworkCancellable {}
extension MOVSAuthorization: NetworkSessionManager {
    public func request(_ request: URLRequest, completion: @escaping CompletionHandler) -> NetworkCancellable {
        return authRequest(request, completion: completion)
    }
}
