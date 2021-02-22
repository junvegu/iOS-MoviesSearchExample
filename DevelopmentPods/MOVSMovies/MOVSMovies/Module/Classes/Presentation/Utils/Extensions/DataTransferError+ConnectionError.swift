//
//  DataTransferError+ConnectionError.swift
//  MOVSMovies
//
//  Created by Junior on 2/21/21.
//

import Foundation
import MOVSNetworking

extension DataTransferError: ConnectionError {
    public var isInternetConnectionError: Bool {
        guard case let DataTransferError.networkFailure(networkError) = self,
            case .notConnected = networkError else {
                return false
        }
        return true
    }
}
