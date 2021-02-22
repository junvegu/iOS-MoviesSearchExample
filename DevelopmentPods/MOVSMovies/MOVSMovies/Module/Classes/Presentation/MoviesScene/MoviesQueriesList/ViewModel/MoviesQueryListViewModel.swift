//
//  MoviesQueryListViewModel.swift
//  MOVSMovies
//
//  Created by Junior on 2/21/21.
//

import Foundation

typealias MoviesQueryListViewModelDidSelectAction = (MovieQuery) -> Void

protocol MoviesQueryListViewModelInput {
    func viewWillAppear()
    func didSelect(item: MoviesQueryListItemViewModel)
}

protocol MoviesQueryListViewModelOutput {
    var items: Observable<[MoviesQueryListItemViewModel]> { get }
}

protocol MoviesQueryListViewModel: MoviesQueryListViewModelInput, MoviesQueryListViewModelOutput { }

final class DefaultMoviesQueryListViewModel: MoviesQueryListViewModel {

    private let numberOfQueriesToShow: Int
    private let fetchRecentMovieQueriesUseCase: FetchRecentMovieQueriesUseCase
    private let didSelect: MoviesQueryListViewModelDidSelectAction?
    
    // MARK: - OUTPUT
    let items: Observable<[MoviesQueryListItemViewModel]> = Observable([])
    
    init(numberOfQueriesToShow: Int,
         fetchRecentMovieQueriesUseCase: FetchRecentMovieQueriesUseCase,
         didSelect: MoviesQueryListViewModelDidSelectAction? = nil) {
        self.numberOfQueriesToShow = numberOfQueriesToShow
        self.fetchRecentMovieQueriesUseCase = fetchRecentMovieQueriesUseCase
        self.didSelect = didSelect
    }
    
    private func updateMoviesQueries() {
        let request = FetchRecentMovieQueriesUseCaseRequestValue(maxCount: numberOfQueriesToShow)
        _ = fetchRecentMovieQueriesUseCase.execute(requestValue: request) { result in
            switch result {
            case .success(let items):
                self.items.value = items.map { $0.query }.map(MoviesQueryListItemViewModel.init)
            case .failure: break
            }
        }
    }
}

// MARK: - INPUT
extension DefaultMoviesQueryListViewModel {
        
    func viewWillAppear() {
        updateMoviesQueries()
    }
    
    func didSelect(item: MoviesQueryListItemViewModel) {
        didSelect?(MovieQuery(query: item.query))
    }
}
