//
//  SubscribersViewController.swift
//  FitMeets
//
//  Created by Илья Морин on 01.05.2023.
//

import UIKit

class SubscribersViewController: UIViewController {
    
    let users = Bundle.main.decode([MUser].self, from: "users.json")
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Int, MUser>!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .orange
        setupSearchBar()
        setupCollectionView()
        createDataSource()
        reloadData(with: nil)
    }
    
    private func setupCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createCompositionalLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .black
        view.addSubview(collectionView)
        
        collectionView.register(UserCell.self, forCellWithReuseIdentifier: UserCell.reuseId)
    }
    
    private func setupSearchBar() {
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.shadowImage = UIImage()
        
        let customTitleView = CustomTitleView()
        customTitleView.searchBar.delegate = self
        customTitleView.messageButton.addTarget(self, action: #selector(messageButtonTapped), for: .touchUpInside)
        
        navigationItem.titleView = customTitleView
        
        NSLayoutConstraint.activate([
            customTitleView.widthAnchor.constraint(equalToConstant: view.bounds.width - 32),
            customTitleView.heightAnchor.constraint(equalToConstant: 44)
        ])
    }

    
    @objc private func messageButtonTapped() {
        let chatViewController = ChatViewController()
        navigationController?.pushViewController(chatViewController, animated: true)
    }

    private func reloadData(with searchText: String?) {
        let filtered = users.filter { (user) -> Bool in
            user.contains(filter: searchText)
        }
        var snapshot = NSDiffableDataSourceSnapshot<Int, MUser>()
        snapshot.appendSections([0])
        //snapshot.appendItems(filtered, toSection: 0)

        dataSource?.apply(snapshot, animatingDifferences: true)
    }
}

extension SubscribersViewController {
    private func createDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Int, MUser>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, user) -> UICollectionViewCell? in
            
            guard indexPath.section == 0 else {
                fatalError("Unknown section kind")
            }
            
            
            return self.configure(collectionView: collectionView, cellType: UserCell.self, with: user, for: indexPath)
        })
    }
}

extension SubscribersViewController {
    private func createCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            
            switch sectionIndex {
            case 0:
                return self.createUsersSection()
            default:
                fatalError("Unknown section kind")
            }
        }
        
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 20
        layout.configuration = config
        return layout
    }
    
    private func createUsersSection() -> NSCollectionLayoutSection {
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
    
// MARK: - UISearchBarDelegate
extension SubscribersViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        reloadData(with: searchText)
    }
}
    
// MARK: - SwiftUI
import SwiftUI

struct SubscribersVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let tabBarVC = MainTabBarController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<SubscribersVCProvider.ContainerView>) -> MainTabBarController{
            return tabBarVC
        }
        
        func updateUIViewController(_ uiViewController: SubscribersVCProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<SubscribersVCProvider.ContainerView>) {
            
        }
    }
}

