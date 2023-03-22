//
//  ViewController.swift
//  FitMeets
//
//  Created by Илья Морин on 09.02.2023.
//

import UIKit

class AuthViewController: UIViewController {

    var button: UIButton = {
        let button = UIButton()
        return button
    }()
    
    let logoLabel = UILabel(text: "F I T M E E T S", font: .cooperHewitt50(), textColor: .white);
    let emailLabel = UILabel(text: "Sign Up", font: .montserrat18(), textColor: .white);
    let loginLabel = UILabel(text: "Already onboard?", font: .montserrat18(), textColor: .white)
    
    let signUpButton = UIButton(title: "Email", titleColor: .white, backGroundColor: .CustomGray(), font: .montserrat18(), isShadow: false, cornerRadius: 4)
    
    let signInButton = UIButton(title: "Login", titleColor: .white, backGroundColor: .CustomYellowGreen(), font: .montserrat18(), isShadow: false, cornerRadius: 4)
    
    private func setupButtons() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignbackground()
        setupConstraints()
    }
    
    func assignbackground(){
            let background = UIImage(named: "Pasted Graphic.jpeg")

            var imageView : UIImageView!
            imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
            imageView.clipsToBounds = true
            imageView.image = background
            imageView.center = view.center
            view.addSubview(imageView)
            self.view.sendSubviewToBack(imageView)
    }
}

// MARK: - Setup constraints
extension AuthViewController {
    private func setupConstraints() {
        
        logoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let emailView = ButtonFormView(label: emailLabel, button: signUpButton)
        let loginView = ButtonFormView(label: loginLabel, button: signInButton)
    
        let stackView = UIStackView(arrangedSubviews: [emailView,loginView], axis: .vertical, spacing: 60)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(logoLabel)
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([logoLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 160), logoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)])
        
        NSLayoutConstraint.activate([stackView.topAnchor.constraint(equalTo: logoLabel.bottomAnchor, constant: 160), stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40), stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)])
    }
}

// MARK: - SwiftUI
import SwiftUI

struct AuthVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let viewController = AuthViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<AuthVCProvider.ContainerView>) -> AuthViewController{
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: AuthVCProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<AuthVCProvider.ContainerView>) {
            
        }
        
        
    }
}
