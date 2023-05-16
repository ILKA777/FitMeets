//
//  SettingsViewController.swift
//  FitMeets
//
//  Created by Илья Морин on 16.05.2023.
//

import UIKit

class SettingsViewController: UIViewController, UIPopoverPresentationControllerDelegate{
    var selectedLanguage: String?
    var selectedTheme: String?

    let titleLabel = UILabel(text: "Settings", font: .montserratBlack25(), textColor: .white)
    
    let language = ["Russian", "English"]
    let theme = ["Black", "White"]
    let deleteAccountButton = UIButton(title: "Delete Account", titleColor: .white, backGroundColor: .CustomGray(), font: .montserrat18(), isShadow: false, cornerRadius: 4)
    let languageButton = UIButton(title: "Change Language", titleColor: .black, backGroundColor: .CustomYellowGreen(), font: .montserrat18(), isShadow: false, cornerRadius: 4)
    let themeButton = UIButton(title: "Change Theme", titleColor: .black, backGroundColor: .CustomYellowGreen(), font: .montserrat18(), isShadow: false, cornerRadius: 4)
    
    
    
    lazy var languageTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "LanguageCell")
        return tableView
    }()
    
    lazy var themeTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ThemeCell")
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        languageTableView.delegate = self
        languageTableView.dataSource = self
        languageTableView.frame = CGRect(x: 0, y: 0, width: 200, height: 300)
        
        themeTableView.delegate = self
        themeTableView.dataSource = self
        themeTableView.frame = CGRect(x: 0, y: 0, width: 200, height: 300)
        
        let languagePopoverViewController = UIViewController()
        languagePopoverViewController.view.addSubview(languageTableView)
        languagePopoverViewController.preferredContentSize = CGSize(width: 200, height: 300)
        
        
        let themePopoverViewController = UIViewController()
        themePopoverViewController.view.addSubview(themeTableView)
        themePopoverViewController.preferredContentSize = CGSize(width: 200, height: 300)
        
        let swipeLeftGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeGesture(_:)))
            swipeLeftGesture.direction = .left
            view.addGestureRecognizer(swipeLeftGesture)
            
            
        let swipeRightGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeGesture(_:)))
        swipeRightGesture.direction = .right
        view.addGestureRecognizer(swipeRightGesture)
        
        languageButton.addTarget(self, action: #selector(showLanguageList(_:)), for: .touchUpInside)
        themeButton.addTarget(self, action: #selector(showThemeList(_:)), for: .touchUpInside)
        setupViews()
        setupConstraints()
        view.backgroundColor = .black
    }
    
    @objc private func handleSwipeGesture(_ gesture: UISwipeGestureRecognizer) {
        if gesture.direction == .left {
        } else if gesture.direction == .right {
            navigationController?.popViewController(animated: true)
            navigationController?.setNavigationBarHidden(false, animated: true)
        }
    }

    
    @objc func showThemeList(_ sender: UIButton) {
        let popoverViewController = UIViewController()
        popoverViewController.view.addSubview(themeTableView)
        popoverViewController.preferredContentSize = CGSize(width: 200, height: 300)
        
        let popover = popoverViewController.popoverPresentationController
        popover?.sourceView = sender
        popover?.sourceRect = CGRect(x: sender.bounds.midX, y: sender.bounds.midY, width: 0, height: 0)
        popover?.permittedArrowDirections = .up
        popover?.backgroundColor = .white
        
        popoverViewController.popoverPresentationController?.delegate = self
        
        present(popoverViewController, animated: true) {
            if let selectedTheme = self.selectedTheme {
                self.themeButton.setTitle(selectedTheme, for: .normal)
            }
        }
    }

    @objc func showLanguageList(_ sender: UIButton) {
        let popoverViewController = UIViewController()
        popoverViewController.view.addSubview(languageTableView)
        popoverViewController.preferredContentSize = CGSize(width: 200, height: 300)
        
        let popover = popoverViewController.popoverPresentationController
        popover?.sourceView = sender
        popover?.sourceRect = CGRect(x: sender.bounds.midX, y: sender.bounds.midY, width: 0, height: 0)
        popover?.permittedArrowDirections = .up
        popover?.backgroundColor = .white
        
        popoverViewController.popoverPresentationController?.delegate = self
        
        present(popoverViewController, animated: true) {
            if let selectedLanguage = self.selectedLanguage {
                self.languageButton.setTitle(selectedLanguage, for: .normal)
            }
        }
    }


    private func setupViews() {
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        languageButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(languageButton)

        themeButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(themeButton)
        

        deleteAccountButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(deleteAccountButton)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.pinLeft(to: self.view, 40),
            titleLabel.pinTop(to: self.view, 90)
        ])

        NSLayoutConstraint.activate([
            languageButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            languageButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            languageButton.widthAnchor.constraint(equalToConstant: 250),
            languageButton.heightAnchor.constraint(equalToConstant: 40)
        ])

        NSLayoutConstraint.activate([
            themeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            themeButton.topAnchor.constraint(equalTo: languageButton.bottomAnchor, constant: 20),
            themeButton.widthAnchor.constraint(equalToConstant: 250),
            themeButton.heightAnchor.constraint(equalToConstant: 40)
        ])

        NSLayoutConstraint.activate([
            deleteAccountButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            deleteAccountButton.topAnchor.constraint(equalTo: themeButton.bottomAnchor, constant: 20),
            deleteAccountButton.widthAnchor.constraint(equalToConstant: 250),
            deleteAccountButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == languageTableView {
            return language.count
        } else if tableView == themeTableView {
            return theme.count
        }
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == languageTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "LanguageCell", for: indexPath)
            cell.textLabel?.text = language[indexPath.row]
            return cell
        } else if tableView == themeTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ThemeCell", for: indexPath)
            cell.textLabel?.text = theme[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == languageTableView {
                selectedLanguage = language[indexPath.row]
                languageButton.setTitle(selectedLanguage, for: .normal)
            } else if tableView == themeTableView {
                selectedTheme = theme[indexPath.row]
                themeButton.setTitle(selectedTheme, for: .normal)
            }
            tableView.deselectRow(at: indexPath, animated: true)
            dismiss(animated: true, completion: nil)
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    
    func popoverPresentationControllerDidDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) {
        
        if let selectedLanguage = selectedLanguage {
            languageButton.setTitle(selectedLanguage, for: .normal)
        }
        if let selectedTheme = selectedTheme {
            themeButton.setTitle(selectedTheme, for: .normal)
        }
    }
}
