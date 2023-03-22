//
//  MainTabBarController.swift
//  FitMeets
//
//  Created by Илья Морин on 13.03.2023.
//

import UIKit

class MainTabBarController:UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let listViewController = ListViewController()
        let peopleViewController = PeopleViewController()
        
        viewControllers = [
            
            listViewController,
            peopleViewController
        ]
    }
}
