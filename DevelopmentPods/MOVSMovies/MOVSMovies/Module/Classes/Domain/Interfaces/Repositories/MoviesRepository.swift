//
//  MoviesRepositoryInterfaces.swift
//  MOVSMovies
//
//  Created by Junior on 2/21/21.
//

import Foundation

protocol MoviesRepository {
    @discardableResult
    func fetchMoviesList(query: MovieQuery, page: Int,
                         cached: @escaping (MoviesPage) -> Void,
                         completion: @escaping (Result<MoviesPage, Error>) -> Void) -> Cancellable?
}
