//
//  PosterImagesRepositoryInterface.swift
//  MOVSMovies
//
//  Created by Junior on 2/21/21.
//
import Foundation

protocol PosterImagesRepository {
    func fetchImage(with imagePath: String, width: Int, completion: @escaping (Result<Data, Error>) -> Void) -> Cancellable?
}
