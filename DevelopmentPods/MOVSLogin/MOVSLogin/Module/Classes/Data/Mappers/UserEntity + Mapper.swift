//
//  UserEntity + Mapper.swift
//  MOVSLogin
//
//  Created by Junior on 2/21/21.
//

import Foundation
extension UserEntity {
    func mapToDomainModel() -> User {
        return .init(name: "Sr. \(first_name) \(last_name)")
    }
}
