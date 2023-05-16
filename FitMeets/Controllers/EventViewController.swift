//
//  EventViewController.swift
//  FitMeets
//
//  Created by Илья Морин on 16.05.2023.
//

import UIKit

class EventViewController: UIViewController {
    let titleLabel: UILabel = {
        let label = UILabel(text: "Бег", font: .montserratBlack25(), textColor: .white)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.borderColor = UIColor.red.cgColor;
        imageView.layer.borderWidth = 2.0
    
        return imageView
    }()
    
    let sportTypeLabel: UILabel = {
        let label = UILabel(text: "Sport type", font: .montserratBlack18(), textColor: .white)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel(text: "Date", font: .montserratBlack18(), textColor: .white)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel(text: "Time", font: .montserratBlack18(), textColor: .white)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let membersLabel: UILabel = {
        let label = UILabel(text: "Members", font: .montserratBlack18(), textColor: .white)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let ageLabel: UILabel = {
        let label = UILabel(text: "Age", font: .montserratBlack18(), textColor: .white)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let locationTitleLabel: UILabel = {
        let label = UILabel(text: "Location", font: .montserratBlack18(), textColor: .white)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let locationLabel: UILabel = {
        let label = UILabel(text: "Location", font: .montserratBlack18(), textColor: .white)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.isEditable = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    let joinButton: UIButton = {
        let button = UIButton(title: "I will go!", titleColor: .black, backGroundColor: .CustomYellowGreen(), font: .montserrat20(), isShadow: false, cornerRadius: 4)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        setupConstraints()
    }
    private func setupConstraints() {
        let labelsStackView = UIStackView(arrangedSubviews: [sportTypeLabel, dateLabel, timeLabel, membersLabel, ageLabel, locationTitleLabel])
        labelsStackView.axis = .vertical
        labelsStackView.spacing = 35
        labelsStackView.translatesAutoresizingMaskIntoConstraints = false

        let valuesStackView = UIStackView(arrangedSubviews: [createValueLabel("Running"), createValueLabel("May 18, 2023"), createValueLabel("8:00 AM"), createValueLabel("15"), createValueLabel("18-40"), locationLabel])
        valuesStackView.axis = .vertical
        valuesStackView.spacing = 35
        valuesStackView.translatesAutoresizingMaskIntoConstraints = false

        

        // Add the subviews to the view hierarchy
        view.addSubview(titleLabel)
        view.addSubview(imageView)
        view.addSubview(labelsStackView)
        view.addSubview(descriptionTextView)
        view.addSubview(joinButton)
        view.addSubview(valuesStackView) // Add valuesStackView to the view hierarchy

        // Set up constraints
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

            valuesStackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16), // Align valuesStackView with labelsStackView
            valuesStackView.leadingAnchor.constraint(equalTo: labelsStackView.trailingAnchor, constant: 16), // Place valuesStackView to the right of labelsStackView
            valuesStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16), // Align valuesStackView with the right edge of the view


            descriptionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            descriptionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            descriptionTextView.bottomAnchor.constraint(equalTo: joinButton.topAnchor, constant: -20),
            descriptionTextView.heightAnchor.constraint(equalToConstant: 120),

            joinButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            joinButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            joinButton.widthAnchor.constraint(equalToConstant: 150)
        ])
    }

    

    private func createValueLabel(_ text: String) -> UILabel {
        let label = UILabel()
        label.font = .montserrat20()
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
