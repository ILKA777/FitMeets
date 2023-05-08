//
//  SelectSportsViewController.swift
//  FitMeets
//
//  Created by Илья Морин on 09.03.2023.
//

import UIKit

class SelectSportsViewController: UIViewController {
    
    let sports = ["football", "hockey", "chess", "volleyball",
                  "cycling", "ski", "basketball", "yoga",
                  "climbing", "dancing", "running", "swimming"]
    var selectedSports = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
    
    let sportsLabel = UILabel(text: "Profile", font: .montserratBlack30(), textColor: .white)
    let continueButton = UIButton(title: "Continue", titleColor: .black, backGroundColor: .CustomYellowGreen(), font: .montserrat18(), isShadow: false, cornerRadius: 4)
    private func navigateToAddPhotoVC() {
        let addPhotoVC = AddPhotoViewController()
        navigationController?.pushViewController(addPhotoVC, animated: true)
    }

    
    func setupViews() {
        // Set up the background color
        continueButton.addTarget(self, action: #selector(continueButtonTapped(_:)), for: .touchUpInside)

        view.backgroundColor = .black
        let titleLabel = UILabel()
            titleLabel.text = "Favorite sports"
            titleLabel.textColor = .white
        titleLabel.font = .montserratBlack25()
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(titleLabel)
            
            // Add constraints for titleLabel
            NSLayoutConstraint.activate([
                titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
                titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
            ])

        
        
        // Add the subtitle label
        let subtitleLabel = UILabel()
        subtitleLabel.text = "You can skip this part"
        subtitleLabel.textColor = .gray
        subtitleLabel.font = UIFont.systemFont(ofSize: 18)
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(subtitleLabel)
        NSLayoutConstraint.activate([
            subtitleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            subtitleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])

        
        // Add the sport buttons
        let buttonWidth: CGFloat = (view.frame.width - 60) / 3
        let buttonHeight: CGFloat = 50
        var xPosition: CGFloat = 20
        var yPosition: CGFloat = 200
        
        for sport in sports {
            let button = UIButton(type: .system)
            button.frame = CGRect(x: xPosition, y: yPosition, width: buttonWidth, height: buttonHeight)
            button.setTitle(sport, for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
            button.layer.cornerRadius = buttonHeight / 2
            button.layer.borderWidth = 2
            button.layer.borderColor = UIColor.black.cgColor
            button.addTarget(self, action: #selector(sportButtonTapped(_:)), for: .touchUpInside)
            view.addSubview(button)
            
            // Update the position variables for the next button
            xPosition += buttonWidth + 10
            if xPosition + buttonWidth > view.frame.width {
                xPosition = 20
                yPosition += buttonHeight + 10
            }
        }
        
        

  
        
    }
    
    @objc func sportButtonTapped(_ sender: UIButton) {
        let sport = sender.currentTitle!
        if selectedSports.contains(sport) {
            selectedSports.removeAll(where: { $0 == sport })
            sender.backgroundColor = .clear
        } else {
            selectedSports.append(sport)
            sender.backgroundColor = .blue
        }
    }
    
    @objc func continueButtonTapped(_ sender: UIButton) {
        navigateToAddPhotoVC()

        
        
    }
}

// MARK: - Setup constraints
extension SelectSportsViewController {

    private func setupConstraints() {

        

        
        continueButton.translatesAutoresizingMaskIntoConstraints = false
            
        view.addSubview(continueButton)
            
        NSLayoutConstraint.activate([
            continueButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            continueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            continueButton.heightAnchor.constraint(equalToConstant: 60),
            continueButton.widthAnchor.constraint(equalToConstant: 300)
        ])
//        sportsLabel.translatesAutoresizingMaskIntoConstraints = false
//        
//        view.addSubview(sportsLabel)
//        
//        NSLayoutConstraint.activate([
//            sportsLabel.pinLeft(to: self.view, 40),
//            sportsLabel.pinTop(to: self.view, 90)
//        ])
    }
}


// MARK: - SwiftUI
import SwiftUI

struct SelectSportsVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }

    struct ContainerView: UIViewControllerRepresentable {
        let viewController = SelectSportsViewController()

        func makeUIViewController(context: UIViewControllerRepresentableContext<SelectSportsVCProvider.ContainerView>) -> SelectSportsViewController{
            return viewController
        }

        func updateUIViewController(_ uiViewController: SelectSportsVCProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<SelectSportsVCProvider.ContainerView>) {

        }
    }
}
