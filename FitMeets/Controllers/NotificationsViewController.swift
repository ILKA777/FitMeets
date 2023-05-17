//
//  NotificationsViewController.swift
//  FitMeets
//
//  Created by Илья Морин on 22.03.2023.
//

import UIKit

class NotificationsViewController: UIViewController {
    
    var notifications: [MNotification] = []
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Int, MNotification>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        view.backgroundColor = .orange
        setupCollectionView()
        createDataSource()
        loadNotificationsFromJSON()
    }
    
    private func loadNotificationsFromJSON() {
        guard let jsonURL = Bundle.main.url(forResource: "notifications", withExtension: "json") else {
            return
        }
        do {
            let jsonData = try Data(contentsOf: jsonURL)
            let decoder = JSONDecoder()
            notifications = try decoder.decode([MNotification].self, from: jsonData)
            reloadData()
        } catch {
            print("Error decoding notifications from JSON: \(error)")
        }
    }
    
    private func setupCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createCompositionalLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .black
        view.addSubview(collectionView)
        
        collectionView.register(NotificationCell.self, forCellWithReuseIdentifier: NotificationCell.reuseId)
    }
    
    private func setupNavigationBar() {
        let titleLabel = UILabel(text: "Notifications", font: .montserratBlack25(), textColor: .white)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: titleLabel)
    }
    
    private func reloadData() {
        var snapshot = NSDiffableDataSourceSnapshot<Int, MNotification>()
        snapshot.appendSections([0])
        snapshot.appendItems(notifications, toSection: 0)
        
        dataSource?.apply(snapshot, animatingDifferences: true)
    }
}

extension NotificationsViewController {
    private func createDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Int, MNotification>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, notification) -> UICollectionViewCell? in
            
            guard indexPath.section == 0 else {
                fatalError("Unknown section kind")
            }
            
            return self.configure(collectionView: collectionView, cellType: NotificationCell.self, with: notification, for: indexPath)
        })
    }
}

extension NotificationsViewController {
    private func createCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            
            switch sectionIndex {
            case 0:
                return self.createNotificationsSection()
            default:
                fatalError("Unknown section kind")
            }
        }
        
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 30
        layout.configuration = config
        return layout
    }
    
    private func createNotificationsSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(78))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 8
        section.contentInsets = NSDirectionalEdgeInsets.init(top: 16, leading: 20, bottom: 0, trailing: 20)
        
        return section
    }
}
