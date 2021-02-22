//
//  MoviesQueriesItemCell.swift
//  MOVSMovies
//
//  Created by Junior on 2/21/21.
//

import UIKit

final class MoviesQueriesItemCell: UITableViewCell {
    static let height = CGFloat(50)
    static let reuseIdentifier = String(describing: MoviesQueriesItemCell.self)
    
    @IBOutlet private var titleLabel: UILabel!
    
    func fill(with suggestion: MoviesQueryListItemViewModel) {
        self.titleLabel.text = suggestion.query
    }
}
