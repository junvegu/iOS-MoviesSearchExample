//
//  RepositoryTask.swift
//  MOVSMovies
//
//  Created by Junior on 2/21/21.
//

import Foundation
import MOVSNetworking

class RepositoryTask: Cancellable {
    var networkTask: NetworkCancellable?
    var isCancelled: Bool = false
    
    func cancel() {
        networkTask?.cancel()
        isCancelled = true
    }
}
