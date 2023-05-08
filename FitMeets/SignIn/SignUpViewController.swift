//
//  SignUpViewController.swift
//  FitMeets
//
//  Created by Илья Морин on 27.02.2023.
//

import UIKit

class SignUpViewController: UIViewController {
    
    let welcomeLabel = UILabel(text: "Nice to see you!", font: .montserratBlack30(), textColor: .white)
    let emailLabel = UILabel(text: "Email", font: .montserrat18(), textColor: .white)
    let passwordLabel = UILabel(text: "Password", font: .montserrat18(), textColor: .white)
    let confirmPasswordLabel = UILabel(text: "Confirm password", font: .montserrat18(), textColor: .white)
    let alreadyOnBoardLabel = UILabel(text: "Already onboard", font: .montserrat18(), textColor: .white)
    
    
    let emailTextField = OneLineTextField(color: .CustomGray(), text: "enter email")
    let passwordTextField = OneLineTextField(color: .CustomYellowGreen(), text: "enter password")
    let confirmPasswordTextField = OneLineTextField(color: .CustomBlue(), text: "enter the password again")
    
    
    
    let signUpButton = UIButton(title: "Sign Up", titleColor: .white, backGroundColor: .CustomGray(), font: .montserrat18(), isShadow: false, cornerRadius: 4)
    
    let loginButton = UIButton()
    
    private func setupButtons() {
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.CustomYellowGreen(), for: .normal)
        loginButton.titleLabel?.font = .montserrat18()
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        
    }
    
    override func viewDidLoad() {
        setupButtons()
        super.viewDidLoad()
        view.backgroundColor = .black
        setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }

    @objc private func signUpButtonTapped() {
        let setupProfileVC = SetupProfileViewController()
        navigationController?.pushViewController(setupProfileVC, animated: true)
    }

    @objc private func loginButtonTapped() {
        let loginVC = LoginViewController()
        navigationController?.pushViewController(loginVC, animated: true)
    }
    
 
    
}


// MARK: - Setup constraints
extension SignUpViewController {
    private func setupConstraints() {
        
        let emailStackView = UIStackView(arrangedSubviews: [emailLabel, emailTextField], axis: .vertical, spacing: 15)
        let passwordStackView = UIStackView(arrangedSubviews: [passwordLabel, passwordTextField], axis: .vertical, spacing: 15)
        let confirmPasswordStackView = UIStackView(arrangedSubviews: [confirmPasswordLabel, confirmPasswordTextField], axis: .vertical, spacing: 15)
        
        signUpButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        let stackView = UIStackView(arrangedSubviews: [
            emailStackView,
            passwordStackView,
            confirmPasswordStackView,
            signUpButton], axis: .vertical, spacing: 40)
        
        
        loginButton.contentHorizontalAlignment = .leading
        
        let bottomStackView = UIStackView(arrangedSubviews: [alreadyOnBoardLabel, loginButton], axis: .horizontal, spacing: 10)
        
        bottomStackView.alignment = .firstBaseline
        
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(welcomeLabel)
        view.addSubview(stackView)
        view.addSubview(bottomStackView)
        
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)])
        
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 120),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)])
        
        NSLayoutConstraint.activate([
            bottomStackView.topAnchor.constraint(equalTo: stackView.bottomAnchor,constant: 60),
            bottomStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            bottomStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)])
    }
}

// MARK: - SwiftUI
import SwiftUI

struct SignUpVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let viewController = SignUpViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<SignUpVCProvider.ContainerView>) -> SignUpViewController{
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: SignUpVCProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<SignUpVCProvider.ContainerView>) {
            
        }
    }
}
