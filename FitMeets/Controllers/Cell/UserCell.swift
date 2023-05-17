//
//  UserCell.swift
//  FitMeets
//
//  Created by Илья Морин on 01.05.2023.
//

import UIKit

class UserCell: UICollectionViewCell, SelfConfiguringCell {
    
    let userImageView = UIImageView()
    let userName = UILabel(text: "text", font: .montserrat20(), textColor: .white)
    let containerView = UIView()
    let gradientView = UIView()
    
    static var reuseId: String = "UserCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 4
        self.clipsToBounds = true
        backgroundColor = .black
        setupConstraints()
    }
    
    func configure<U>(with value: U) where U : Hashable {
        guard let user: MUser = value as? MUser else { return }
        userImageView.image = UIImage(named: user.avatarStringURL)
        userName.text = user.username
    }
    
    private func setupConstraints() {
        userImageView.translatesAutoresizingMaskIntoConstraints = false
        userName.translatesAutoresizingMaskIntoConstraints = false
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        userImageView.backgroundColor = .red
        gradientView.backgroundColor = .CustomYellowGreen()
        
        addSubview(userImageView)
        addSubview(gradientView)
        addSubview(userName)
        
        NSLayoutConstraint.activate([
            userImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            userImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            userImageView.heightAnchor.constraint(equalToConstant: 78),
            userImageView.widthAnchor.constraint(equalToConstant: 78)
        ])
        
        NSLayoutConstraint.activate([
            userName.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            userName.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 16),
            userName.trailingAnchor.constraint(equalTo: gradientView.leadingAnchor, constant: 16)
            
        ])
        
        NSLayoutConstraint.activate([
            gradientView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            gradientView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            gradientView.heightAnchor.constraint(equalToConstant: 78),
            gradientView.widthAnchor.constraint(equalToConstant: 8)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
