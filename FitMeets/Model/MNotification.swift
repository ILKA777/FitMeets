//
//  MNotification.swift
//  FitMeets
//
//  Created by Илья Морин on 16.05.2023.
//

import UIKit
struct MNotification:Hashable, Codable {
    
    var title: String?
    var time: String?
    var description: String?
    var id: Int
    func hash(into hasher: inout Hasher) {
            hasher.combine(id)
    }
}

