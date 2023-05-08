//
//  MEvent.swift
//  FitMeets
//
//  Created by Илья Морин on 07.05.2023.
//

import UIKit

struct MEvent: Hashable, Decodable {
    
    var sportType: String
    var name: String
    var date: String
    var time: String
    var city: String
    var metro: String
    var description: String
    var photoStringURL: String
    var members: Int
    
    var id: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: MEvent, rhs: MEvent) -> Bool {
        return lhs.id == rhs.id
    }
    
}
