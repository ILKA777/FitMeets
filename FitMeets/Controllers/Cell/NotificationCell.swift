//
//  NotificationCell.swift
//  FitMeets
//
//  Created by Илья Морин on 17.05.2023.
//

import UIKit
class NotificationCell: UICollectionViewCell, SelfConfiguringCell {
    
    let titleLabel = UILabel(text: "Title", font: .montserrat20(), textColor: .white)
    let timeLabel = UILabel(text: "Time", font: .montserrat18(), textColor: .white)
    let descriptionLabel = UILabel(text: "Description", font: .montserrat13(), textColor: .white)
    
    static var reuseId: String = "NotificationCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 4
        self.clipsToBounds = true
        backgroundColor = .black
        setupConstraints()
    }
    
    func configure<U>(with value: U) where U : Hashable {
        guard let notification: MNotification = value as? MNotification else { return }
        titleLabel.text = notification.title
        timeLabel.text = notification.time
        descriptionLabel.text = notification.description
    }
    
    private func setupConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false

        addSubview(titleLabel)
        addSubview(timeLabel)
        addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            
            timeLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            timeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            
            descriptionLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 4),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)

        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
