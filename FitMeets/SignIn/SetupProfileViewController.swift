//
//  SetupProfileViewController.swift
//  FitMeets
//
//  Created by Илья Морин on 05.03.2023.
//

import UIKit



class SetupProfileViewController: UIViewController, UITextFieldDelegate {
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    let profileLabel = UILabel(text: "Profile", font: .montserratBlack30(), textColor: .white)
    let namelLabel = UILabel(text: "Name *", font: .montserrat18(), textColor: .white)
    let surnamelLabel = UILabel(text: "Surname *", font: .montserrat18(), textColor: .white)
    let sexLabel = UILabel(text: "Sex", font: .montserrat18(), textColor: .white)
    let birthdayLabel = UILabel(text: "Birthday", font: .montserrat18(), textColor: .white)
    let cityLabel = UILabel(text: "City", font: .montserrat18(), textColor: .white)
    
    let usernameLabel = UILabel(text: "Username *", font: .montserrat18(), textColor: .white)
    
    let aboutYouLabel = UILabel(text: "About you", font: .montserrat18(), textColor: .white)
    
    let sexSegmentedControl = UISegmentedControl(first: "Male", second: "Female")
    
    let nameTextField = OneLineTextField(font: .montserrat18(), color: .CustomGray(), text: "Enter your name")
    let surnameTextField = OneLineTextField(font: .montserrat18(), color: .CustomGray(), text: "Enter your surname")
    let birthdayTextField = OneLineTextField(font: .montserrat18(), color: .CustomGray(), text: "Enter your birthday")
    let aboutYouTextField = OneLineTextField(font: .montserrat18(), color: .CustomGray(), text: "Enter information about you")
    let cityTextField = OneLineTextField(font: .montserrat18(), color: .CustomGray(), text: "Enter your city")
    let usernameTextField = OneLineTextField(font: .montserrat18() , color: .CustomGray(), text: "Enter your username")
    
    let continueButton = UIButton(title: "Continue", titleColor: .black, backGroundColor: .CustomYellowGreen(), font: .montserrat18(), isShadow: false, cornerRadius: 4)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        continueButton.addTarget(self, action: #selector(navigateToSecondViewController), for: .touchUpInside)
        nameTextField.delegate = self
        birthdayTextField.delegate = self
        aboutYouTextField.delegate = self
        cityTextField.delegate = self
        usernameTextField.delegate = self
        surnameTextField.delegate = self
        setupScrollView()
        setupConstraints()
    }
    
    private func setupScrollView() {
        scrollView.keyboardDismissMode = .interactive
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == usernameTextField || textField == aboutYouTextField {
            moveViewUp()
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == usernameTextField || textField == aboutYouTextField {
            moveViewDown()
        }
    }
    
    
    private func moveViewUp() {
        UIView.animate(withDuration: 0.3) {
            self.view.frame.origin.y = -200
        }
    }
    
    private func moveViewDown() {
        UIView.animate(withDuration: 0.3) {
            self.view.frame.origin.y = 0
        }
    }
    
    @objc func navigateToSecondViewController() {
        
        var name = nameTextField.text
        var surname = surnameTextField.text
        var birthday = birthdayTextField.text
        var username = usernameTextField.text
        var city = cityTextField.text
        var description = aboutYouTextField.text
        UserDefaults.standard.set(name, forKey: "ProfileName")
        UserDefaults.standard.set(surname, forKey: "ProfileSurname")
        UserDefaults.standard.set(birthday, forKey: "ProfileBirthday")
        UserDefaults.standard.set(username, forKey: "ProfileUsername")
        UserDefaults.standard.set(city, forKey: "ProfileCity")
        UserDefaults.standard.set(description, forKey: "ProfileDescription")
        UserDefaults.standard.synchronize()

        let selectSportVC = SelectSportsViewController()
        navigationController?.pushViewController(selectSportVC, animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

// MARK: - Setup constraints
extension SetupProfileViewController {
    
    private func setupConstraints() {
        
        let nameStackView = UIStackView(arrangedSubviews: [namelLabel, nameTextField], axis: .vertical, spacing: 0)
        let surnameStackView = UIStackView(arrangedSubviews: [surnamelLabel, surnameTextField], axis: .vertical, spacing: 0)
        let sexStackView = UIStackView(arrangedSubviews: [sexLabel, sexSegmentedControl], axis: .vertical, spacing: 0)
        let birthdayStackView = UIStackView(arrangedSubviews: [birthdayLabel, birthdayTextField], axis: .vertical, spacing: 0)
        let cityStackView = UIStackView(arrangedSubviews: [cityLabel, cityTextField], axis: .vertical, spacing: 0)
        let usernameStackView = UIStackView(arrangedSubviews: [usernameLabel, usernameTextField], axis: .vertical, spacing: 0)
        let aboutYouStackView = UIStackView(arrangedSubviews: [aboutYouLabel, aboutYouTextField], axis: .vertical, spacing: 0)
        
        continueButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        continueButton.widthAnchor.constraint(equalToConstant: 10).isActive = true
        
        let stackView = UIStackView(arrangedSubviews: [nameStackView, surnameStackView, birthdayStackView, cityStackView, usernameStackView, aboutYouStackView,sexStackView, continueButton], axis: .vertical, spacing: 30)
        
        profileLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(profileLabel)
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: profileLabel.bottomAnchor, constant: 50),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
        ])
        
        NSLayoutConstraint.activate([
            profileLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 90),
            profileLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
        ])
        
        NSLayoutConstraint.activate([
            contentView.heightAnchor.constraint(greaterThanOrEqualTo: stackView.heightAnchor, constant: 20)
        ])
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
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
