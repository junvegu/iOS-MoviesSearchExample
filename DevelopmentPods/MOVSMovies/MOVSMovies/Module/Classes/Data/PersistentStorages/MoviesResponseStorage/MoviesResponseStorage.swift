//
//  MoviesResponseStorage.swift
//  MOVSMovies
//
//  Created by Junior on 2/21/21.
//
import Foundation

protocol MoviesResponseStorage {
    func getResponse(for request: MoviesRequestDTO, completion: @escaping (Result<MoviesResponseDTO?, CoreDataStorageError>) -> Void)
    func save(response: MoviesResponseDTO, for requestDto: MoviesRequestDTO)
}
