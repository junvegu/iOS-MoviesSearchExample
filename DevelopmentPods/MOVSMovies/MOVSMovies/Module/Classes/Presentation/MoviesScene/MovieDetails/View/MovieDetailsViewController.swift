//
//  MovieDetailsViewController.swift
//  MOVSMovies
//
//  Created by Junior on 2/21/21.
//
import UIKit

final class MovieDetailsViewController: UIViewController, StoryboardInstantiable {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var overviewTextView: UITextView!
    @IBOutlet weak var titleUILabel: UILabel!
    @IBOutlet weak var realeseDateUILabel: UILabel!
    
    private var viewModel: MovieDetailsViewModel!

    // MARK: - Lifecycle

    static func create(with viewModel: MovieDetailsViewModel) -> MovieDetailsViewController {
       
        let view = UIStoryboard.init(name: "MovieDetails", bundle: Bundle(for: Self.self).resource).instantiateViewController(withIdentifier: "MovieDetailsViewController") as! MovieDetailsViewController
        view.viewModel = viewModel
        return view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        bind(to: viewModel)
    }
    
    private func bind(to viewModel: MovieDetailsViewModel) {
        viewModel.posterImage.observe(on: self) { [weak self] in self?.posterImageView.image = $0.flatMap(UIImage.init) }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        viewModel.updatePosterImage(width: Int(posterImageView.imageSizeAfterAspectFit.scaledSize.width))
    }

    // MARK: - Private

    private func setupViews() {
        title = viewModel.title
        overviewTextView.text = viewModel.overview
        posterImageView.isHidden = viewModel.isPosterImageHidden
        titleUILabel.text = viewModel.title
        realeseDateUILabel.text = viewModel.realese
        view.accessibilityIdentifier = AccessibilityIdentifier.movieDetailsView
    }
}
