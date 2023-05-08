//
//  LoginViewController.swift
//  FitMeets
//
//  Created by Илья Морин on 05.03.2023.
//

import UIKit

class LoginViewController: UIViewController {
    
    let welcomeLabel = UILabel(text: "Welcome back!", font: .cooperHewitt30(), textColor: .white)
    let emailLabel = UILabel(text: "Email", font: .montserrat18(), textColor: .white)
    let passwordLabel = UILabel(text: "Password", font: .montserrat18(), textColor: .white)
    let needAnAccountLabel = UILabel(text: "Need an account?", font: .montserrat18(), textColor: .white)
    
    let emailTextField = OneLineTextField(color: .CustomGray(), text: "enter email")
    let passwordTextField = OneLineTextField(color: .CustomYellowGreen(), text: "enter password")
    
    let signInButton = UIButton(title: "Sign In", titleColor: .white, backGroundColor: .CustomGray(), font: .montserrat18(), isShadow: false, cornerRadius: 4)
    let signUpButton = UIButton()
    
    
    private func setupButtons() {
        signUpButton.setTitle("Login", for: .normal)
        signUpButton.setTitleColor(.CustomYellowGreen(), for: .normal)
        signUpButton.titleLabel?.font = .montserrat18()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        setupButtons()
        view.backgroundColor = .black
        signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
    }

    @objc private func signInButtonTapped() {
        let mainVC = MainTabBarController()
        navigationController?.pushViewController(mainVC, animated: true)
    }

    @objc private func signUpButtonTapped() {
        let loginVC = SignUpViewController()
        navigationController?.pushViewController(loginVC, animated: true)
    }
    
    
    
}

// MARK: Setup constraints

extension LoginViewController {
    private func setupConstraints() {
        let emailStackView = UIStackView(arrangedSubviews: [emailLabel, emailTextField],
        axis: .vertical,
        spacing: 0)
        
        let passwordStackView = UIStackView(arrangedSubviews: [passwordLabel, passwordTextField],
            axis: .vertical,
            spacing: 0)
        
        
        signInButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        
        let stackView = UIStackView(arrangedSubviews: [emailStackView, passwordStackView, signInButton], axis: .vertical, spacing: 40)
        
        let bottomStackView = UIStackView(arrangedSubviews: [needAnAccountLabel, signUpButton ],
            axis: .horizontal,
            spacing: 0)
        
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false

        
        
        
        bottomStackView.alignment = .firstBaseline
        view.addSubview(welcomeLabel)
        view.addSubview(stackView)
        view.addSubview(bottomStackView)
        
        
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)

        ])
        
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

struct LoginVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let viewController = LoginViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<LoginVCProvider.ContainerView>) -> LoginViewController{
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: LoginVCProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<LoginVCProvider.ContainerView>) {
            
        }
        
        
    }
}
