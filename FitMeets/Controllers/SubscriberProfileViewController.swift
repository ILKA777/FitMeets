//
//  SubscriberProfileViewController.swift
//  FitMeets
//
//  Created by Илья Морин on 17.05.2023.
//


import UIKit

class SubscriberProfileViewController: UIViewController {
    
    var user: MUser?
    let nicknameLabel = UILabel(text: "@nickname", font: .montserratBlack18(), textColor: .white)
    
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
        
        guard let user = user else {
            return
        }
        nicknameLabel.text = user.username
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
        setupProfileImageView()
        setupNameLabel()
        setupAgeCityLabel()
        setupDescriptionTextView()
        setupEventsSegmentedControl()
        setupEventsTableView()
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
        
        eventsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "EventCell")
    }
}

