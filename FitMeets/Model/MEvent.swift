//
//  MEvent.swift
//  FitMeets
//
//  Created by Илья Морин on 07.05.2023.
//

import UIKit

struct MEvent:Hashable, Codable {
    
    var title: String
    var date: String?
    var time: String?
    var city: String?
    var address: String?
    var minAge: Int?
    var maxAge: Int?
    var description: String?
    var numberOfParticipants: Int?
    var avatarStringURL: String?
    var sportType: String?
    var id: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: MEvent, rhs: MEvent) -> Bool {
        return lhs.id == rhs.id
    }
    
    func contains(filter: String?) -> Bool {
        guard let filter = filter else { return true}
        if filter.isEmpty { return true }
        let lowercasedFilter = filter.lowercased()
        return title.lowercased().contains(lowercasedFilter)
    }
}

typealias Events = [MEvent]
