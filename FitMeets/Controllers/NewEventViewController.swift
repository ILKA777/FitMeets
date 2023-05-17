//
//  AddEventViewController.swift
//  FitMeets
//
//  Created by Илья Морин on 22.03.2023.
//

import UIKit

class NewEventViewController: UIViewController, UITextFieldDelegate {
    
    let titleLabel = UILabel(text: "New event", font: .montserratBlack25(), textColor: .white)
    let minAgeTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Min Age"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let maxAgeTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Max Age"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let sportTypeButton = UIButton(title: "Sport type", titleColor: .black, backGroundColor: .CustomYellowGreen(), font: .montserrat18(), isShadow: false, cornerRadius: 4)
    
    let sports = ["football", "hockey", "chess", "volleyball", "cycling", "ski", "basketball", "yoga", "climbing", "dancing", "running", "swimming"]
    
    let eventTitleTextField = OneLineTextField(font: .montserrat18(), color: .CustomGray(), text: "Enter event title")
    
    let dateTextField = OneLineTextField(font: .montserrat18(), color: .CustomGray(), text: "Enter date")
    
    
    let timeSlider = UISlider()
    
    let timeLabel = UILabel(text: "Time", font: .montserrat18(), textColor: .white)
    
    let cityTextField = OneLineTextField(font: .montserrat18(), color: .CustomGray(), text: "Enter city")
    let metroTextField = OneLineTextField(font: .montserrat18(), color: .CustomGray(), text: "Enter metro")
    let addressTextField = OneLineTextField(font: .montserrat18(), color: .CustomGray(), text: "Enter address")
    
    let participantsSlider = UISlider()
    let participantsLabel = UILabel(text: "Participants", font: .montserrat18(), textColor: .white)
    
    let descriptionTextField = OneLineTextField(font: .montserrat18(), color: .CustomGray(), text: "Enter description")
    
    let addPhotoButton = UIButton(title: "Add photo", titleColor: .black, backGroundColor: .CustomYellowGreen(), font: .montserrat18(), isShadow: false, cornerRadius: 4)
    
    let createEventButton = UIButton(title: "Create event", titleColor: .white, backGroundColor: .CustomBlue(), font: .montserrat18(), isShadow: false, cornerRadius: 4)
    
    let sportsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "SportCell")
        return tableView
    }()
    
    let currentTimeLabel = UILabel(text: "00:00", font: .montserrat18(), textColor: .white)
    let minValueLabel = UILabel(text: "00:00", font: .montserrat18(), textColor: .white)
    let maxValueLabel = UILabel(text: "23:59", font: .montserrat18(), textColor: .white)
    
    let currentParticipantsLabel = UILabel(text: "1", font: .montserrat18(), textColor: .white)
    let minParticipantsLabel = UILabel(text: "1", font: .montserrat18(), textColor: .white)
    let maxParticipantsLabel = UILabel(text: "80", font: .montserrat18(), textColor: .white)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTimeSlider()
        participantsTimeSlider()
        minAgeTextField.delegate = self
        maxAgeTextField.delegate = self
        eventTitleTextField.delegate = self
        dateTextField.delegate = self
        cityTextField.delegate = self
        metroTextField.delegate = self
        addressTextField.delegate = self
        descriptionTextField.delegate = self
        
        sportsTableView.dataSource = self
        sportsTableView.frame = CGRect(x: 0, y: 0, width: 200, height: 300)
        
        
        let popoverViewController = UIViewController()
        popoverViewController.view.addSubview(sportsTableView)
        popoverViewController.preferredContentSize = CGSize(width: 200, height: 300)
        
        sportTypeButton.addTarget(self, action: #selector(showSportsList(_:)), for: .touchUpInside)
        
        timeSlider.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
        participantsSlider.addTarget(self,
                                     action: #selector(participantsSliderValueChanged(_:)), for: .valueChanged)
        view.backgroundColor = .black
        setupConstraints()
        addPhotoButton.addTarget(self, action: #selector(addPhotoButtonTapped(_:)), for: .touchUpInside)
        createEventButton.addTarget(self, action: #selector(createEventButtonTapped(_:)), for: .touchUpInside)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.first != nil {
            view.endEditing(true)
        }
        super.touchesBegan(touches, with: event)
    }
    
    @objc func addPhotoButtonTapped(_ sender: UIButton) {
        
    }
    
    var homeViewController: HomeViewController?
    @objc func createEventButtonTapped(_ sender: UIButton) {
        let title = eventTitleTextField.text ?? ""
        let minAge = Int(minAgeTextField.text ?? "") ?? 0
        let maxAge = Int(maxAgeTextField.text ?? "") ?? 0
        let sportType = sportTypeButton.title(for: .normal) ?? ""
        let date = dateTextField.text ?? ""
        let time = currentTimeLabel.text ?? ""
        let city = cityTextField.text ?? ""
        let metro = metroTextField.text ?? ""
        let address = addressTextField.text ?? ""
        let participants = Int(currentParticipantsLabel.text ?? "") ?? 0
        let description = descriptionTextField.text ?? ""
        
        UserDefaults.standard.set(title, forKey: "EventTitle")
        UserDefaults.standard.set(minAge, forKey: "EventMinAge")
        UserDefaults.standard.set(maxAge, forKey: "EventMaxAge")
        UserDefaults.standard.set(sportType, forKey: "EventSportType")
        UserDefaults.standard.set(date, forKey: "EventDate")
        UserDefaults.standard.set(time, forKey: "EventTime")
        UserDefaults.standard.set(city, forKey: "EventCity")
        UserDefaults.standard.set(metro, forKey: "EventMetro")
        UserDefaults.standard.set(address, forKey: "EventAddress")
        UserDefaults.standard.set(participants, forKey: "EventMembers")
        UserDefaults.standard.set(description, forKey: "EventDescription")
        UserDefaults.standard.synchronize()
    }
    
    private func setupTimeSlider() {
        timeSlider.minimumValue = 0
        timeSlider.maximumValue = 1439
        timeSlider.value = 0
    }
    
    private func participantsTimeSlider() {
        participantsSlider.minimumValue = 1
        participantsSlider.maximumValue = 80
        participantsSlider.value = 1
    }
    
    @objc func participantsSliderValueChanged(_ sender: UISlider) {
        let sliderValue = Int(sender.value)
        currentParticipantsLabel.text = String(sliderValue)
    }
    
    @objc func sliderValueChanged(_ sender: UISlider) {
        let sliderValue = Int(sender.value)
        let hours = sliderValue / 60
        let minutes = sliderValue % 60
        currentTimeLabel.text = String(format: "%02d:%02d", hours, minutes)
    }
    
    @objc func showSportsList(_ sender: UIButton) {
        let popoverViewController = UIViewController()
        popoverViewController.view.addSubview(sportsTableView)
        popoverViewController.preferredContentSize = CGSize(width: 200, height: 300)
        
        let popover = popoverViewController.popoverPresentationController
        popover?.sourceView = sender
        popover?.sourceRect = CGRect(x: sender.bounds.midX, y: sender.bounds.midY, width: 0, height: 0)
        popover?.permittedArrowDirections = .up
        popover?.backgroundColor = .white
        
        present(popoverViewController, animated: true, completion: nil)
    }
}

// MARK: - Setup constraints
extension NewEventViewController {
    
    private func setupConstraints() {
        let sportTypeStackView = UIStackView(arrangedSubviews: [sportTypeButton], axis: .vertical, spacing: 0)
        
        let dateStackView = UIStackView(arrangedSubviews: [dateTextField], axis: .vertical, spacing: 0)
        let eventTitleStackView = UIStackView(arrangedSubviews: [eventTitleTextField], axis: .vertical, spacing: 0)
        
        let timeLabelsStackView = UIStackView(arrangedSubviews: [minValueLabel, currentTimeLabel, maxValueLabel], axis: .horizontal, spacing: 10)
        timeLabelsStackView.distribution = .equalSpacing
        
        let timeStackView = UIStackView(arrangedSubviews: [timeLabel, timeSlider, timeLabelsStackView], axis: .vertical, spacing: 10)
        
        let cityStackView = UIStackView(arrangedSubviews: [cityTextField], axis: .vertical, spacing: 0)
        
        let metroStackView = UIStackView(arrangedSubviews: [metroTextField], axis: .vertical, spacing: 0)
        
        let addressStackView = UIStackView(arrangedSubviews: [addressTextField], axis: .vertical, spacing: 0)
        
        let participantsLabelsStackView = UIStackView(arrangedSubviews: [minParticipantsLabel, currentParticipantsLabel, maxParticipantsLabel], axis: .horizontal, spacing: 10)
        participantsLabelsStackView.distribution = .equalSpacing
        
        let participantsStackView = UIStackView(arrangedSubviews: [participantsLabel, participantsSlider, participantsLabelsStackView], axis: .vertical, spacing: 10)
        
        let descriptionStackView = UIStackView(arrangedSubviews: [descriptionTextField], axis: .vertical, spacing: 0)
        
        let addPhotoStackView = UIStackView(arrangedSubviews: [addPhotoButton], axis: .vertical, spacing: 0)
        let createEventStackView = UIStackView(arrangedSubviews: [addPhotoButton, createEventButton], axis: .vertical, spacing: 20)
        
        let ageStackView = UIStackView(arrangedSubviews: [minAgeTextField, maxAgeTextField], axis: .horizontal, spacing: 10)
        ageStackView.distribution = .fillEqually
        
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        let stackView = UIStackView(arrangedSubviews: [sportTypeStackView, eventTitleStackView, dateStackView, timeStackView, cityStackView, metroStackView, addressStackView, participantsStackView,ageStackView, descriptionStackView, addPhotoStackView, createEventStackView], axis: .vertical, spacing: 30)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(stackView)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -10),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -80)
        ])
        
        NSLayoutConstraint.activate([
            createEventButton.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.pinLeft(to: self.view, 40),
            titleLabel.pinTop(to: self.view, 90)
        ])
        
        NSLayoutConstraint.activate([
            minAgeTextField.heightAnchor.constraint(equalToConstant: 40),
            maxAgeTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}

// MARK: - SwiftUI
import SwiftUI

struct NewEventVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    struct ContainerView: UIViewControllerRepresentable {
        let viewController = NewEventViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<NewEventVCProvider.ContainerView>) -> NewEventViewController{
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: NewEventVCProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<NewEventVCProvider.ContainerView>) {
        }
    }
}

// MARK: - Table view delegate and datasource methods
extension NewEventViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sports.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SportCell", for: indexPath)
        cell.textLabel?.text = sports[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        sportTypeButton.setTitle(sports[indexPath.row], for: .normal)
        dismiss(animated: true, completion: nil)
    }
    
}
