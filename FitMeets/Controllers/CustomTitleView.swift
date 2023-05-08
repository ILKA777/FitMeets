//
//  CustomTitleView.swift
//  FitMeets
//
//  Created by Илья Морин on 01.05.2023.
//

import UIKit
class CustomTitleView: UIView {
    
    let searchBar: UISearchBar
    let messageButton: UIButton
    
    init() {
        searchBar = UISearchBar()
        messageButton = UIButton(type: .system)
        
        super.init(frame: .zero)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        searchBar.searchBarStyle = .minimal
        searchBar.tintColor = .white
        searchBar.placeholder = "Search"
        let messageImage = UIImage(systemName: "message")!
        
        messageButton.setImage(messageImage, for: .normal)
        messageButton.tintColor = .CustomYellowGreen()
        
        addSubview(searchBar)
        addSubview(messageButton)
        
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        messageButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            searchBar.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            searchBar.topAnchor.constraint(equalTo: self.topAnchor),
            searchBar.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            messageButton.leadingAnchor.constraint(equalTo: searchBar.trailingAnchor, constant: 8),
            messageButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            messageButton.topAnchor.constraint(equalTo: self.topAnchor),
            messageButton.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
