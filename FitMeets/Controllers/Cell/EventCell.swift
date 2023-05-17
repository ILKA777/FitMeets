//
//  EventCell.swift
//  FitMeets
//
//  Created by Илья Морин on 17.05.2023.
//

import UIKit

class EventCell: UICollectionViewCell, SelfConfiguringCell {
    
    let eventImageView = UIImageView()
    let titleLabel = UILabel(text: "text", font: .montserrat20(), textColor: .white)
    let dateLabel = UILabel(text: "text", font: .montserrat13(), textColor: .white)
    let locationLabel = UILabel(text: "text", font: .montserrat13(), textColor: .white)
    let gradientView = UIView()
    
    static var reuseId: String = "EventCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 4
        self.clipsToBounds = true
        backgroundColor = .black
        setupConstraints()
    }
    
    func configure<U>(with value: U) where U: Hashable {
        guard let event: MEvent = value as? MEvent else { return }
        titleLabel.text = event.title
        dateLabel.text = event.date
        eventImageView.image = UIImage(named: event.avatarStringURL ?? "Vector")
        locationLabel.text = event.city
    }
    
    private func setupConstraints() {
        eventImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        gradientView.backgroundColor = .CustomYellowGreen()
        
        addSubview(eventImageView)
        addSubview(titleLabel)
        addSubview(gradientView)
        addSubview(dateLabel)
        addSubview(locationLabel)
        
        NSLayoutConstraint.activate([
            eventImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            eventImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            eventImageView.heightAnchor.constraint(equalToConstant: 78),
            eventImageView.widthAnchor.constraint(equalToConstant: 78)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: eventImageView.trailingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            dateLabel.leadingAnchor.constraint(equalTo: eventImageView.trailingAnchor, constant: 16),
            dateLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            locationLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 8),
            locationLabel.leadingAnchor.constraint(equalTo: eventImageView.trailingAnchor, constant: 16),
            locationLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 16)
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
