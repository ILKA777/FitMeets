//
//  SetupProfileViewController.swift
//  FitMeets
//
//  Created by Илья Морин on 05.03.2023.
//

import UIKit

class SetupProfileViewController: UIViewController {

    let profileLabel = UILabel(text: "Profile", font: .montserratBlack30(), textColor: .white)
    let namelLabel = UILabel(text: "Name *", font: .montserrat18(), textColor: .white)
    let sexLabel = UILabel(text: "Sex", font: .montserrat18(), textColor: .white)
    let birthdayLabel = UILabel(text: "Birthday", font: .montserrat18(), textColor: .white)
    let cityLabel = UILabel(text: "City", font: .montserrat18(), textColor: .white)

    let usernameLabel = UILabel(text: "Username *", font: .montserrat18(), textColor: .white)

    let aboutYouLabel = UILabel(text: "About you", font: .montserrat18(), textColor: .white)

    let sexSegmentedControl = UISegmentedControl(first: "Male", second: "Female")
    



    let nameTextField = OneLineTextField(font: .montserrat18(), color: .CustomGray(), text: "Enter your name")
    let birthdayTextField = OneLineTextField(font: .montserrat18(), color: .CustomGray(), text: "Enter your birthday")
    let aboutYouTextField = OneLineTextField(font: .montserrat18(), color: .CustomGray(), text: "Enter information about you")
    let cityTextField = OneLineTextField(font: .montserrat18(), color: .CustomGray(), text: "Enter your city")
    let usernameTextField = OneLineTextField(font: .montserrat18() , color: .CustomGray(), text: "Enter your username")




    let continueButton = UIButton(title: "Continue", titleColor: .black, backGroundColor: .CustomYellowGreen(), font: .montserrat18(), isShadow: false, cornerRadius: 4)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupConstraints()
    }
}

// MARK: - Setup constraints
extension SetupProfileViewController {

    private func setupConstraints() {

        let nameStackView = UIStackView(arrangedSubviews: [namelLabel, nameTextField], axis: .vertical, spacing: 0)

        let sexStackView = UIStackView(arrangedSubviews: [sexLabel, sexSegmentedControl], axis: .vertical, spacing: 0)

        let birthdayStackView = UIStackView(arrangedSubviews: [birthdayLabel, birthdayTextField], axis: .vertical, spacing: 0)

        let cityStackView = UIStackView(arrangedSubviews: [cityLabel, cityTextField], axis: .vertical, spacing: 0)

        let usernameStackView = UIStackView(arrangedSubviews: [usernameLabel, usernameTextField], axis: .vertical, spacing: 0)

        let aboutYouStackView = UIStackView(arrangedSubviews: [aboutYouLabel, aboutYouTextField], axis: .vertical, spacing: 0)

        continueButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        continueButton.widthAnchor.constraint(equalToConstant: 10).isActive = true

        let stackView = UIStackView(arrangedSubviews: [nameStackView,  birthdayStackView, cityStackView, usernameStackView, aboutYouStackView,sexStackView, continueButton], axis: .vertical, spacing: 30)
        
        profileLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileLabel)
        view.addSubview(stackView)
        
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: profileLabel.bottomAnchor, constant: 50),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)])
        

        NSLayoutConstraint.activate([
            
            profileLabel.pinLeft(to: self.view, 40),
            profileLabel.pinTop(to: self.view, 90)
            
        ])
    }
}
// MARK: - SwiftUI
import SwiftUI

struct SetupProfileVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }

    struct ContainerView: UIViewControllerRepresentable {
        let viewController = SetupProfileViewController()

        func makeUIViewController(context: UIViewControllerRepresentableContext<SetupProfileVCProvider.ContainerView>) -> SetupProfileViewController{
            return viewController
        }

        func updateUIViewController(_ uiViewController: SetupProfileVCProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<SetupProfileVCProvider.ContainerView>) {

        }
    }
}

