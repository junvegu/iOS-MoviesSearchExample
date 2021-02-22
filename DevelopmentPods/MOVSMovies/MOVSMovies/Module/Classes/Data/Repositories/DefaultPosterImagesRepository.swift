//
//  DefaultPosterImagesRepository.swift
//  MOVSMovies
//
//  Created by Junior on 2/21/21.
//
import Foundation
import MOVSNetworking

final class DefaultPosterImagesRepository {

    private let dataTransferService: DataTransferService

    init(dataTransferService: DataTransferService) {
        self.dataTransferService = dataTransferService
    }
}

extension DefaultPosterImagesRepository: PosterImagesRepository {

    func fetchImage(with imagePath: String, width: Int, completion: @escaping (Result<Data, Error>) -> Void) -> Cancellable? {

        let endpoint = APIEndpoints.getMoviePoster(path: imagePath, width: width)
        let task = RepositoryTask()
        task.networkTask = dataTransferService.request(with: endpoint) { (result: Result<Data, DataTransferError>) in

            let result = result.mapError { $0 as Error }
            DispatchQueue.main.async { completion(result) }
        }
        return task
    }
}
