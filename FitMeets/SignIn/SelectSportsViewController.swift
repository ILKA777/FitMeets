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
    }
    
    let sportsLabel = UILabel(text: "Profile", font: .montserratBlack30(), textColor: .white)
    
    func setupViews() {
        // Set up the background color
        view.backgroundColor = .black
        
        // Add the title label
//        let sportsLabel = UILabel(text: "Profile", font: .montserratBlack30(), textColor: .white)
        
        //UILabel(frame: CGRect(x: 20, y: 50, width: view.frame.width - 40, height: 50))
//        sportsLabel.text = "Favorite sports"
//        sportsLabel.textColor = .white
//        sportsLabel.font = UIFont.boldSystemFont(ofSize: 28)
//        view.addSubview(sportsLabel)
        
        // Add the subtitle label
        let subtitleLabel = UILabel(frame: CGRect(x: 20, y: 100, width: view.frame.width - 40, height: 30))
        subtitleLabel.text = "You can skip this part"
        subtitleLabel.textColor = .gray
        subtitleLabel.font = UIFont.systemFont(ofSize: 18)
        view.addSubview(subtitleLabel)
        
        // Add the sport buttons
        let buttonWidth: CGFloat = (view.frame.width - 60) / 3
        let buttonHeight: CGFloat = 50
        var xPosition: CGFloat = 20
        var yPosition: CGFloat = 150
        
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
        
        // Add the continue button
        let continueButton = UIButton(type: .system)
        continueButton.frame = CGRect(x: 0, y: view.frame.height - 100, width: view.frame.width, height: 50)
        continueButton.setTitle("Continue", for: .normal)
        continueButton.setTitleColor(.white, for: .normal)
        continueButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        continueButton.backgroundColor = .blue
        continueButton.addTarget(self, action: #selector(continueButtonTapped(_:)), for: .touchUpInside)
        view.addSubview(continueButton)
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
        // Do something with the selected sports
        
        
    }
}

// MARK: - Setup constraints
extension SetupProfileViewController {

    private func setupConstraints() {

        

        continueButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        
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
