//
//  MoviesListItemViewModel.swift
//  MOVSMovies
//
//  Created by Junior on 2/21/21.
//


import Foundation

struct MoviesListItemViewModel: Equatable {
    let title: String
    let overview: String
    let releaseDate: String
    let posterImagePath: String?
}

extension MoviesListItemViewModel {

    init(movie: Movie) {
        self.title = movie.title ?? ""
        self.posterImagePath = movie.posterPath
        self.overview = movie.overview ?? ""
        if let releaseDate = movie.releaseDate {
            self.releaseDate = "Lanzamiento: \(dateFormatter.string(from: releaseDate))"
        } else {
            self.releaseDate = "Proximamennte"
        }
    }
}

private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    return formatter
}()
