//
//  CGSize+ScaledSize.swift
//  MOVSMovies
//
//  Created by Junior on 2/21/21.
//

import Foundation
import UIKit

extension CGSize {
    var scaledSize: CGSize {
        .init(width: width * UIScreen.main.scale, height: height * UIScreen.main.scale)
    }
}
