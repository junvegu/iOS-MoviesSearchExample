//
//  MoviesQueryListItemViewModel.swift
//  MOVSMovies
//
//  Created by Junior on 2/21/21.
//

import Foundation

class MoviesQueryListItemViewModel {
    let query: String

    init(query: String) {
        self.query = query
    }
}

extension MoviesQueryListItemViewModel: Equatable {
    static func == (lhs: MoviesQueryListItemViewModel, rhs: MoviesQueryListItemViewModel) -> Bool {
        return lhs.query == rhs.query
    }
}
