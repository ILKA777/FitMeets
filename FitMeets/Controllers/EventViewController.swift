//
//  EventViewController.swift
//  FitMeets
//
//  Created by Илья Морин on 16.05.2023.
//

import UIKit


protocol EventViewControllerDelegate: AnyObject {
    func eventViewControllerDidSelectEvent(_ event: MEvent)
}

class EventViewController: UIViewController {
    weak var delegate: EventViewControllerDelegate?
    var event: MEvent?
    let titleLabel: UILabel = {
        let label = UILabel(text: "Бег", font: .montserratBlack25(), textColor: .white)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    let sportTypeLabel: UILabel = {
        let label = UILabel(text: "Sport type", font: .montserratBlack14(), textColor: .white)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel(text: "Date", font: .montserratBlack14(), textColor: .white)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel(text: "Time", font: .montserratBlack14(), textColor: .white)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let membersLabel: UILabel = {
        let label = UILabel(text: "Members", font: .montserratBlack14(), textColor: .white)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let ageLabel: UILabel = {
        let label = UILabel(text: "Age", font: .montserratBlack14(), textColor: .white)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let locationTitleLabel: UILabel = {
        let label = UILabel(text: "Location", font: .montserratBlack14(), textColor: .white)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let locationLabel: UILabel = {
        let label = UILabel(text: "Location", font: .montserratBlack14(), textColor: .white)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.font = .montserrat13()
        textView.textColor = .white
        textView.backgroundColor = .black
        textView.isEditable = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    let joinButton: UIButton = {
        let button = UIButton(title: "I will go!", titleColor: .black, backGroundColor: .CustomYellowGreen(), font: .montserrat20(), isShadow: false, cornerRadius: 4)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(joinButtonTapped(_:)), for: .touchUpInside)
        return button
    }()
    @objc private func joinButtonTapped(_ sender: UIButton) {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let event = event else {
            return
        }
        titleLabel.text = event.title
        sportTypeLabel.text = event.sportType
        dateLabel.text = event.date
        timeLabel.text = event.time
        membersLabel.text = String((event.numberOfParticipants) ?? 0)
        ageLabel.text = String((event.minAge) ?? 0) + " - " + String((event.minAge) ?? 0)
        locationLabel.text = (event.city ?? " ")
        descriptionTextView.text = event.description
        imageView.image = UIImage(named: "\(event.avatarStringURL)") ?? UIImage(named: "Vector")
        
        view.backgroundColor = .black
        setupConstraints()
    }
    private func setupConstraints() {
        let labelsStackView = UIStackView(arrangedSubviews: [sportTypeLabel, dateLabel, timeLabel, membersLabel, ageLabel, locationLabel])
        labelsStackView.axis = .vertical
        labelsStackView.spacing = 20
        labelsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let valuesStackView = UIStackView(arrangedSubviews: [createValueLabel("Sport type"), createValueLabel("Date"), createValueLabel("Time"), createValueLabel("Members"), createValueLabel("Age"), locationTitleLabel])
        valuesStackView.axis = .vertical
        valuesStackView.spacing = 20
        valuesStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(titleLabel)
        view.addSubview(imageView)
        view.addSubview(labelsStackView)
        view.addSubview(descriptionTextView)
        view.addSubview(joinButton)
        view.addSubview(valuesStackView)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            imageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25),
            
            labelsStackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16),
            labelsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            valuesStackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16),
            valuesStackView.leadingAnchor.constraint(equalTo: labelsStackView.trailingAnchor, constant: 16),
            valuesStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            descriptionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            descriptionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            descriptionTextView.topAnchor.constraint(equalTo: valuesStackView.bottomAnchor, constant: 20),
            descriptionTextView.heightAnchor.constraint(equalToConstant: 120),
            
            joinButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            joinButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            joinButton.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    private func createValueLabel(_ text: String) -> UILabel {
        let label = UILabel()
        label.font = .montserrat13()
        label.textColor = .white
        label.text = text
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}

// MARK: - SwiftUI
import SwiftUI

struct EventVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let eventVC = EventViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<EventVCProvider.ContainerView>) -> EventViewController{
            return eventVC
        }
        
        func updateUIViewController(_ uiViewController: EventVCProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<EventVCProvider.ContainerView>) {
            
        }
    }
}
