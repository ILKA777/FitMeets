//
//  UserProfileViewController.swift
//  FitMeets
//
//  Created by Илья Морин on 07.05.2023.
//

import UIKit

class UserProfileViewController: UIViewController {
    
    let nicknameLabel = UILabel(text: "@nickname", font: .montserratBlack18(), textColor: .white)
    let settingsButton = UIButton()
    let profileImageView = UIImageView()
    let nameLabel = UILabel()
    let ageCityLabel = UILabel()
    let descriptionTextView = UITextView()
    let eventsSegmentedControl = UISegmentedControl(first: "Organized", second: "Accepted", third: "Passed")
    
    let eventsTableView = UITableView()
    
    var organizedEvents = [MEvent]()
    var acceptedEvents = [MEvent]()
    var passedEvents = [MEvent]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSwipeGestureRecognizers()
        setupUI()
    }
    
    private func setupSwipeGestureRecognizers() {
        let swipeLeftGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeGesture(_:)))
        swipeLeftGesture.direction = .left
        view.addGestureRecognizer(swipeLeftGesture)
        
        let swipeRightGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeGesture(_:)))
        swipeRightGesture.direction = .right
        view.addGestureRecognizer(swipeRightGesture)
    }
    
    @objc private func handleSwipeGesture(_ gesture: UISwipeGestureRecognizer) {
        if gesture.direction == .left {
        } else if gesture.direction == .right {
            navigationController?.popViewController(animated: true)
            navigationController?.setNavigationBarHidden(false, animated: true)
        }
    }
    
    private func setupUI() {
        view.backgroundColor = .black
        setupNicknameLabel()
        setupSettingsButton()
        setupProfileImageView()
        setupNameLabel()
        setupAgeCityLabel()
        setupDescriptionTextView()
        setupEventsSegmentedControl()
        setupEventsTableView()
    }
    
    @objc private func settingsButtonTapped(_ sender: UIButton) {
        let settingsViewController = SettingsViewController()
        navigationController?.pushViewController(settingsViewController, animated: true)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @objc private func eventsSegmentChanged(_ sender: UISegmentedControl) {
        eventsTableView.reloadData()
    }
    
    private func setupNicknameLabel() {
        nicknameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nicknameLabel)
        
        NSLayoutConstraint.activate([
            nicknameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            nicknameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
        
        nicknameLabel.text = (UserDefaults.standard.string(forKey: "ProfileUsername") ?? " ")
        nicknameLabel.font = UIFont.montserratBlack18()
        nicknameLabel.textColor = .white
        
    }
    
    private func setupSettingsButton() {
        settingsButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(settingsButton)
        
        NSLayoutConstraint.activate([
            settingsButton.centerYAnchor.constraint(equalTo: nicknameLabel.centerYAnchor),
            settingsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            settingsButton.widthAnchor.constraint(equalToConstant: 44),
            settingsButton.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        settingsButton.setImage(UIImage(systemName: "gear"), for: .normal)
        settingsButton.addTarget(self, action: #selector(settingsButtonTapped(_:)), for: .touchUpInside)
    }
    
    private func setupProfileImageView() {
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileImageView)
        
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: nicknameLabel.bottomAnchor, constant: 16),
            profileImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            profileImageView.widthAnchor.constraint(equalToConstant: 80),
            profileImageView.heightAnchor.constraint(equalToConstant: 80)
        ])
        
        profileImageView.layer.cornerRadius = 40
        profileImageView.layer.masksToBounds = true
        profileImageView.backgroundColor = .gray
    }
    
    
    private func setupNameLabel() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: profileImageView.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: settingsButton.trailingAnchor)
        ])
        
        
        nameLabel.text = (UserDefaults.standard.string(forKey: "ProfileName") ?? " ")  + " " + (UserDefaults.standard.string(forKey: "ProfileSurname") ?? " ")
        nameLabel.font = .montserrat20()
        nameLabel.textColor = .white
    }
    
    private func setupAgeCityLabel() {
        ageCityLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(ageCityLabel)
        
        NSLayoutConstraint.activate([
            ageCityLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            ageCityLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            ageCityLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor)
        ])
        
        ageCityLabel.text = (UserDefaults.standard.string(forKey: "ProfileBirhday") ?? " ") +
        ", " + (UserDefaults.standard.string(forKey: "ProfileCity") ?? " ")
        ageCityLabel.font = .montserrat13()
        ageCityLabel.textColor = .gray
    }
    
    private func setupDescriptionTextView() {
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(descriptionTextView)
        
        NSLayoutConstraint.activate([
            descriptionTextView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 16),
            descriptionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            descriptionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            descriptionTextView.heightAnchor.constraint(equalToConstant: 80)
        ])
    
        descriptionTextView.text = UserDefaults.standard.string(forKey: "ProfileDescription")
        descriptionTextView.textColor = .white
        descriptionTextView.font = .montserrat13()
        descriptionTextView.isEditable = false
        descriptionTextView.backgroundColor = .black
    }
    
    private func setupEventsSegmentedControl() {
        
        eventsSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(eventsSegmentedControl)
        
        NSLayoutConstraint.activate([
            eventsSegmentedControl.topAnchor.constraint(equalTo: descriptionTextView.bottomAnchor, constant: 8),
            eventsSegmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            eventsSegmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        eventsSegmentedControl.addTarget(self, action: #selector(eventsSegmentChanged(_:)), for: .valueChanged)
        eventsSegmentedControl.selectedSegmentIndex = 0
    }
    
    private func setupEventsTableView() {
        eventsTableView.backgroundColor = .black
        eventsTableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(eventsTableView)
        
        NSLayoutConstraint.activate([
            eventsTableView.topAnchor.constraint(equalTo: eventsSegmentedControl.bottomAnchor, constant: 16),
            eventsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            eventsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            eventsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        eventsTableView.dataSource = self
        eventsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "EventCell")
    }
}

extension UserProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch eventsSegmentedControl.selectedSegmentIndex {
        case 0:
            return organizedEvents.count
        case 1:
            return acceptedEvents.count
        case 2:
            return passedEvents.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath)
        
        let event: MEvent
        switch eventsSegmentedControl.selectedSegmentIndex {
        case 0:
            event = organizedEvents[indexPath.row]
        case 1:
            event = acceptedEvents[indexPath.row]
        case 2:
            event = passedEvents[indexPath.row]
        default:
            fatalError("Invalid segment index")
        }
        
        cell.textLabel?.text = event.description
        
        return cell
    }
}



// MARK: - SwiftUI
import SwiftUI

struct UserProfileVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let tabBarVC = MainTabBarController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<UserProfileVCProvider.ContainerView>) -> MainTabBarController{
            return tabBarVC
        }
        
        func updateUIViewController(_ uiViewController: UserProfileVCProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<UserProfileVCProvider.ContainerView>) {
            
        }
    }
}
