//
//  MUser.swift
//  FitMeets
//
//  Created by Илья Морин on 01.05.2023.
//

import UIKit

struct MUser: Hashable, Decodable {
    var username: String
    var avatarImageString: String
    var id: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: MUser, rhs: MUser) -> Bool {
        return lhs.id == rhs.id
    }
    
    
}
