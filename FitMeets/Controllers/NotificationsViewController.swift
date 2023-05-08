//
//  NotificationsViewController.swift
//  FitMeets
//
//  Created by Илья Морин on 22.03.2023.
//

import UIKit

class NotificationsViewController: UIViewController {
    let titleLabel = UILabel(text: "Notifications", font: .montserratBlack25(), textColor: .white)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.pinLeft(to: self.view, 40),
            titleLabel.pinTop(to: self.view, 90)
        ])
        view.backgroundColor = .black
    }
}

