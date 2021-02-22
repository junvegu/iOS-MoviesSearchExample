//
//  MoviesRequestDTO+Mapping.swift
//  MOVSMovies
//
//  Created by Junior on 2/21/21.
//
import Foundation

struct MoviesRequestDTO: Encodable {
    let query: String
    let page: Int
}
