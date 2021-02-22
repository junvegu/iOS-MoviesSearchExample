//
//  APIEndpoints.swift
//  MOVSMovies
//
//  Created by Junior on 2/21/21.
//

import Foundation
import MOVSNetworking

struct APIEndpoints {
    
    static func getMovies(with moviesRequestDTO: MoviesRequestDTO) -> Endpoint<MoviesResponseDTO> {

        return Endpoint(path: "3/search/movie/",
                        method: .get,
                        queryParametersEncodable: moviesRequestDTO)
    }
    
    static func getMoviePoster(path: String, width: Int) -> Endpoint<Data> {

        let sizes = [92, 154, 185, 342, 500, 780]
        let closestWidth = sizes.enumerated().min { abs($0.1 - width) < abs($1.1 - width) }?.element ?? sizes.first!
        
        return Endpoint(path: "t/p/w\(closestWidth)\(path)",
                        method: .get,
                        responseDecoder: RawDataResponseDecoder())
    }
}
