//
//  NotificationCell.swift
//  FitMeets
//
//  Created by Илья Морин on 16.05.2023.
//

import UIKit

//class NotificationCell: UICollectionViewCell, SelfConfiguringCell {
//    
//    let titleLabel = UILabel(text: "Title", font: .montserrat20(), textColor: .white)
//    let timeLabel = UILabel(text: "Time", font: .montserrat20(), textColor: .white)
//    let descriptionLabel = UILabel(text: "Description", font: .montserrat20(), textColor: .white)
//    let containerView = UIView()
//    let gradientView = UIView()
//    
//    static var reuseId: String = "NotificationCell"
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        self.layer.cornerRadius = 4
//        self.clipsToBounds = true
//        backgroundColor = .black
//        setupConstraints()
//    }
//    
//    func configure<U>(with value: U) where U : Hashable {
//        guard let notification: MNotification = value as? MNotification else { return }
//        titleLabel.text = notification.title
//        timeLabel.text = notification.time
//        descriptionLabel.text = notification.description
//    }
//    
//    private func setupConstraints() {
//        titleLabel.translatesAutoresizingMaskIntoConstraints = false
//        timeLabel.translatesAutoresizingMaskIntoConstraints = false
//        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
//        gradientView.translatesAutoresizingMaskIntoConstraints = false
//        gradientView.backgroundColor = .CustomYellowGreen()
//        
//        addSubview(titleLabel)
//        addSubview(timeLabel)
//        addSubview(descriptionLabel)
//        addSubview(gradientView)
//        
//        // Update these constraints to fit your layout needs
//        NSLayoutConstraint.activate([
//            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
//            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
//            titleLabel.trailingAnchor.constraint(equalTo: gradientView.leadingAnchor, constant: 16)
//        ])
//        
//        NSLayoutConstraint.activate([
//            timeLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
//            timeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
//            timeLabel.trailingAnchor.constraint(equalTo: gradientView.leadingAnchor, constant: 16)
//        ])
//        
//        NSLayoutConstraint.activate([
//            descriptionLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 8),
//            descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
//            descriptionLabel.trailingAnchor.constraint(equalTo: gradientView.leadingAnchor, constant: 16)
//        ])
//        
//        NSLayoutConstraint.activate([
//            gradientView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
//            gradientView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
//            gradientView.heightAnchor.constraint(equalToConstant: 78),
//            gradientView.widthAnchor.constraint(equalToConstant: 8)
//        ])
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}
