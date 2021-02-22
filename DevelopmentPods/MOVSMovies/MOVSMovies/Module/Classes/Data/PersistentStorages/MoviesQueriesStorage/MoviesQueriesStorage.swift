//
//  MoviesQueriesStorage.swift
//  MOVSMovies
//
//  Created by Junior on 2/21/21.
//

import Foundation

protocol MoviesQueriesStorage {
    func fetchRecentsQueries(maxCount: Int, completion: @escaping (Result<[MovieQuery], Error>) -> Void)
    func saveRecentQuery(query: MovieQuery, completion: @escaping (Result<MovieQuery, Error>) -> Void)
}
