//
//  NSError + InternetConnection.swift
//  MOVSLogin
//
//  Created by Junior on 2/21/21.
//

import Foundation
public protocol ConnectionError: Error {
    var isInternetConnectionError: Bool { get }
}

public extension Error {
    var isInternetConnectionError: Bool {
        guard let error = self as? ConnectionError, error.isInternetConnectionError else {
            return false
        }
        return true
    }
}