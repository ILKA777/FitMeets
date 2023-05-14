//
//  RegisterRequest.swift
//  FitMeets
//
//  Created by Dashbah on 09.05.2023.
//

import Foundation

struct RegisterRequest : Encodable {
    var firstname : String
    var lastname : String
    var email : String
    var password : String
}
