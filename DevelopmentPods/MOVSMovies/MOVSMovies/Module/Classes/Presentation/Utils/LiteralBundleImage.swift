//
//  Image+LiteralBundle.swift
//  MOVSMovies
//
//  Created by Junior on 2/21/21.
//
import Foundation

final class LiteralBundleImage: _ExpressibleByImageLiteral {
    let image: UIImage?
    
    required init(imageLiteralResourceName name: String) {
        image = UIImage(named: name, in: Bundle(for: Self.self).resource, compatibleWith: nil)
    }
}
