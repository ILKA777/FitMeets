//
//  homeViewController.swift
//  FitMeets
//
//  Created by Илья Морин on 22.03.2023.
//

import UIKit

class HomeViewController:UIViewController {
    
    
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
        
        ApiManager.shared.getEevent {
            events in print(events.count)
        }

        setupCollectionView()
    }

    
    
    private func setupCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .black
        view.addSubview(collectionView)
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellid")
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func setupSearchBar() {
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        searchController.searchBar.searchTextField.textColor = .white

        // Определите констрэйнты для searchBar
        searchController.searchBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(searchController.searchBar)

        NSLayoutConstraint.activate([
            searchController.searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchController.searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            searchController.searchBar.heightAnchor.constraint(equalToConstant: 50)
        ])

    }
}


// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid", for: indexPath)
        cell.backgroundColor = .red
        return cell
        
    }
    
}

extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
    
}
// MARK: - SwiftUI
import SwiftUI

struct HomeVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }

    struct ContainerView: UIViewControllerRepresentable {
        let tabBarVC = MainTabBarController()

        func makeUIViewController(context: UIViewControllerRepresentableContext<HomeVCProvider.ContainerView>) -> MainTabBarController{
            return tabBarVC
        }

        func updateUIViewController(_ uiViewController: HomeVCProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<HomeVCProvider.ContainerView>) {

        }
    }
}


