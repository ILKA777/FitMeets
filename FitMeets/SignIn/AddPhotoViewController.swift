//
//  AddPhotoViewController.swift
//  FitMeets
//
//  Created by Илья Морин on 07.05.2023.
//
import UIKit

class AddPhotoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        setupViews()
        setupConstraints()
    }
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Photo"
        label.textColor = .white
        label.font = .montserratBlack25()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "You can skip this part"
        label.textColor = .gray
        label.font = .systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let addPhotoView: AddPhotoView = {
        let view = AddPhotoView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let createAccountButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Create account", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .CustomYellowGreen()
        button.titleLabel?.font = .montserrat18()
        button.layer.cornerRadius = 4
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    @objc func createAccountButtonTapped(_ sender: UIButton) {
        let homeVC = MainTabBarController()
        homeVC.modalPresentationStyle = .fullScreen
        present(homeVC, animated: true, completion: nil)
    }

    
    func setupViews() {
        createAccountButton.addTarget(self, action: #selector(createAccountButtonTapped(_:)), for: .touchUpInside)

        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(addPhotoView)
        view.addSubview(createAccountButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            
            subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            
            addPhotoView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addPhotoView.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 100),
            
            createAccountButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            createAccountButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            createAccountButton.widthAnchor.constraint(equalToConstant: 300),
            createAccountButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}
// MARK: - SwiftUI
import SwiftUI

struct AddPhotoVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let viewController = AddPhotoViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<AddPhotoVCProvider.ContainerView>) -> AddPhotoViewController{
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: AddPhotoVCProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<AddPhotoVCProvider.ContainerView>) {
            
        }
    }
}
