//
//  ApiManager.swift
//  FitMeets
//
//  Created by Илья Морин on 09.05.2023.
//

import UIKit

enum ApiType {
    
    case login
    case getUsers
    case getEvent
    
    var baseURL: String {
        return "https://jsonplaceholder.typicode.com/"
    }
    
    var headers: [String: String] {
        switch self {
        case.login:
            return ["authToken": "12345"]
        default:
            return [:]
        }
    }
    
    var path: String {
        switch self {
        case .login: return "login"
        case .getEvent: return "event"
        case .getUsers: return "users"
        }
    }
    
    // наверное нужна обработка всяких 404 505 ошибок потому что
    // тут явно извлекаем значения из url без проверок
    var request: URLRequest {
        let url = URL(string: path, relativeTo:
        URL(string: baseURL)!)!
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = headers
        switch self {
        case .login:
            request.httpMethod = "POST"
            return request
        default:
            request.httpMethod = "GET"
            return request
        }
    }
    
}

class ApiManager {
    static let shared = ApiManager()
    
    func getEevent(completion: @escaping (Events) -> Void) {
        let request = ApiType.getEvent.request
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data, let events = try? JSONDecoder().decode(Events.self, from: data) {
                completion(events)
            } else {
                completion([])
            }
        }
        task.resume()
    }
    
//    func getUsers(completion: @escaping (MUser) -> Void) {
//        let request = ApiType.getEvent.request
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            if let data = data, let users = try? JSONDecoder().decode(MUser.self, from: data) {
//                completion(users)
//            } else {
//                completion([])
//            }
//        }
//        task.resume()
//    }
    
}



