//
//  MOVSNetworkingSettings.swift
//  MOVSNetworking
//
//  Created by Junior on 2/21/21.
//

import Foundation
public protocol NetworkConfigurable {
    var base: URL { get }
    var headers: [String: String] { get }
    var queryParameters: [String: String] { get }
}
public struct MOVSNetworkingSettings:  NetworkConfigurable {
    public let base: URL
    public let headers: [String: String]
    public let queryParameters: [String: String]
    
    public init(url: URL, headers: [String: String] = [:], queryParameters: [String: String] ) {
        self.base = url
        self.headers = headers
        self.queryParameters = queryParameters
    }
}
