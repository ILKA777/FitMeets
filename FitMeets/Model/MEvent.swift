//
//  MEvent.swift
//  FitMeets
//
//  Created by Илья Морин on 07.05.2023.
//

import UIKit

struct MEvent: Codable {
    
    var date: String?
    var time: String?
    var place: String?
    var minAge: Int?
    var maxAge: Int?
    var description: String?
    var numberOfParticipants: Int?
    
    var sportType: String?
    //var name: String
    
    //var metro: String
    
    //var photoStringURL: String
    
    
//    var id: Int
//    
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(id)
//    }
//    
//    static func == (lhs: MEvent, rhs: MEvent) -> Bool {
//        return lhs.id == rhs.id
//    }
    
}
typealias Events = [MEvent]
