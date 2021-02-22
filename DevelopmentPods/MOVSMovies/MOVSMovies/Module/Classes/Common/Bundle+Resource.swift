//
//  Bundle+Resource.swift
//  MOVSMovies
//
//  Created by Junior on 2/21/21.
//
import Foundation

 extension Bundle {
     var resource: Bundle {
        // static framework
        if let resourceURL = resourceURL,
            let resourceBundle = Bundle(url: resourceURL.appendingPathComponent(ModuleName.name + ".bundle")) {
            return resourceBundle
        } else {
        // dynamic framework
            return self
        }
     }
 }

private struct ModuleName {
    static var name: String = {
        String(reflecting: ModuleName.self).components(separatedBy: ".").first ?? ""
    }()
}
