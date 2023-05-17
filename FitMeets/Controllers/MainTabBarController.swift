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
        navigationItem.hidesBackButton = true
        
        tabBar.tintColor = .CustomYellowGreen()
        let homeViewController = HomeViewController()
        let subscribersViewController = SubscribersViewController()
        let addEventViewController = NewEventViewController()
        let profileViewController = UserProfileViewController()
        let notificationsViewController = NotificationsViewController()
        
        let homeImage = UIImage(systemName: "house")!
        let peopleImage = UIImage(systemName: "person.2")!
        let plusImage = UIImage(systemName: "plus.circle")!
        let personImage = UIImage(systemName: "person")!
        let bellImage = UIImage(systemName: "bell")!
        
        viewControllers = [
            generateNavigationController(rootViewController: homeViewController, title: "", image: homeImage),
            generateNavigationController(rootViewController: subscribersViewController, title: "", image: peopleImage),
            generateNavigationController(rootViewController: addEventViewController, title: "", image: plusImage),
            generateNavigationController(rootViewController: notificationsViewController, title: "", image: bellImage),
            generateNavigationController(rootViewController: profileViewController, title: "", image: personImage)
        ]
    }
    
    private func generateNavigationController(rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        return navigationVC
    }
}
