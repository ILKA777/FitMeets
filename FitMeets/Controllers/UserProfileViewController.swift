//
//  UserProfileViewController.swift
//  FitMeets
//
//  Created by Илья Морин on 07.05.2023.
//

import UIKit

class UserProfileViewController: UIViewController {
    
    let nicknameLabel = UILabel()
    let settingsButton = UIButton()
    let profileImageView = UIImageView()
    let nameLabel = UILabel()
    let ageCityLabel = UILabel()
    let descriptionTextView = UITextView()
//    let eventsSegmentedControl = UISegmentedControl(items: ["Organized", "Accepted", "Passed"])
    let eventsSegmentedControl = UISegmentedControl(first: "Organized", second: "Accepted", third: "Passed")
    
    let eventsTableView = UITableView()
    
    // Пример данных для таблицы
    var organizedEvents = [MEvent]()
    var acceptedEvents = [MEvent]()
    var passedEvents = [MEvent]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        loadData()
    }
    
    private func setupUI() {
        view.backgroundColor = .black
        
        // Настройка UI элементов и добавление их на view
        setupNicknameLabel()
        setupSettingsButton()
        setupProfileImageView()
        setupNameLabel()
        setupAgeCityLabel()
        setupDescriptionTextView()
        setupEventsSegmentedControl()
        setupEventsTableView()
    }
    
    private func loadData() {
        // Загрузка данных для профиля и таблиц
    }
    
    @objc private func settingsButtonTapped(_ sender: UIButton) {
        // Переход к настройкам профиля
    }
    
    @objc private func eventsSegmentChanged(_ sender: UISegmentedControl) {
        // Обновление данных таблицы при изменении сегмента
        eventsTableView.reloadData()
    }
    
    // Настройка UI элементов
    private func setupNicknameLabel() {
        nicknameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nicknameLabel)
        
        NSLayoutConstraint.activate([
            nicknameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            nicknameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
        
        // Настройка текста, шрифта и цвета
        nicknameLabel.text = "@nickname"
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
        
        // Настройка иконки и обработчика события
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
        
        // Настройка круглой формы изображения
        profileImageView.layer.cornerRadius = 40
        profileImageView.layer.masksToBounds = true
        profileImageView.backgroundColor = .gray // Временный цвет
    }
    
    
    private func setupNameLabel() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: profileImageView.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: settingsButton.trailingAnchor)
        ])
        
        // Настройка текста, шрифта и цвета
        nameLabel.text = "John Doe"
        nameLabel.font = UIFont.systemFont(ofSize: 20)
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
        
        // Настройка текста, шрифта и цвета
        ageCityLabel.text = "25 years, New York"
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
        
        // Настройка текста, шрифта и цвета
        descriptionTextView.text = "A brief description of the user profile..."
        descriptionTextView.textColor = .white
        descriptionTextView.font = UIFont.systemFont(ofSize: 14)
        descriptionTextView.isEditable = false
        descriptionTextView.backgroundColor = .black
    }
    
    private func setupEventsSegmentedControl() {
     
        eventsSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(eventsSegmentedControl)
        
        NSLayoutConstraint.activate([
            eventsSegmentedControl.topAnchor.constraint(equalTo: descriptionTextView.bottomAnchor, constant: 16),
            eventsSegmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            eventsSegmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        // Настройка обработчика события
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
        
        // Настройка делегата и источника данных
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
        
        // Настройка ячейки с данными мероприятия
        cell.textLabel?.text = event.name
        // Здесь можно добавить дополнительную настройку ячейки
        
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
