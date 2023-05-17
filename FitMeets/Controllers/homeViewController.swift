//
//  homeViewController.swift
//  FitMeets
//
//  Created by Илья Морин on 22.03.2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    var events: [MEvent] = []
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Int, MEvent>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        setupCollectionView()
        setupSearchBar()
        createDataSource()
        loadEventsFromJSON()
        collectionView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadfromNewEvent()
    }
    
    func loadfromNewEvent() {
        
        let maxID = events.max(by: { $0.id < $1.id })?.id ?? 0
        var id = maxID + 1
        
        events.append(MEvent(title: UserDefaults.standard.string(forKey: "EventTitle") ?? "Title",
                             date: UserDefaults.standard.string(forKey: "EventDate") ?? "Date",
                             time: UserDefaults.standard.string(forKey: "EventTime") ?? "Time",
                             city: UserDefaults.standard.string(forKey: "EventCity") ?? "City",
                             address: UserDefaults.standard.string(forKey: "EventAddress") ?? "Address",
                             minAge: UserDefaults.standard.integer(forKey: "EventMinAge") ?? 0,
                             maxAge: UserDefaults.standard.integer(forKey: "EventMaxAge") ?? 0,
                             description: UserDefaults.standard.string(forKey: "EventDescription") ?? "Description",
                             numberOfParticipants: UserDefaults.standard.integer(forKey: "EventMembers") ?? 0,
                             avatarStringURL:  "Vector",
                             sportType: UserDefaults.standard.string(forKey: "EventSportType") ?? "Type",
                             id: id))
        
        reloadData(with: nil)
    }
    
    func loadEventsFromJSONString(jsonString: String) {
        guard let jsonData = jsonString.data(using: .utf8) else {
            print("Invalid JSON string")
            return
        }
        do {
            let decoder = JSONDecoder()
            events = try decoder.decode([MEvent].self, from: jsonData)
            reloadData(with: nil)
        } catch {
            print("Error decoding events from JSON: \(error)")
        }
    }
    
    func loadEventsFromJSON() {
        guard let jsonURL = Bundle.main.url(forResource: "events", withExtension: "json") else {
            return
        }
        do {
            let jsonData = try Data(contentsOf: jsonURL)
            let decoder = JSONDecoder()
            events = try decoder.decode([MEvent].self, from: jsonData)
            reloadData(with: nil)
        } catch {
            print("Error decoding events from JSON: \(error)")
        }
    }
    
    private func setupCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createCompositionalLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .black
        view.addSubview(collectionView)
        collectionView.register(EventCell.self, forCellWithReuseIdentifier: EventCell.reuseId)
    }
    
    private func reloadData(with searchText: String?) {
        let filtered = events.filter { (event) -> Bool in
            event.contains(filter: searchText)
        }
        var snapshot = NSDiffableDataSourceSnapshot<Int, MEvent>()
        snapshot.appendSections([0])
        snapshot.appendItems(filtered, toSection: 0)
        dataSource?.apply(snapshot, animatingDifferences: true)
    }
    
    private func setupSearchBar() {
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.shadowImage = UIImage()
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        searchController.searchBar.searchTextField.textColor = .white
    }
}

extension HomeViewController {
    private func createDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Int, MEvent>(collectionView: collectionView) { (collectionView, indexPath, event) -> UICollectionViewCell? in
            
            guard indexPath.section == 0 else {
                fatalError("Unknown section kind")
            }
            
            return self.configure(collectionView: collectionView, cellType: EventCell.self, with: event, for: indexPath)
        }
    }
}

extension HomeViewController {
    private func createCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            
            switch sectionIndex {
            case 0:
                return self.createEventsSection()
            default:
                fatalError("Unknown section kind")
            }
        }
        
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 20
        layout.configuration = config
        return layout
    }
    
    private func createEventsSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(120))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 1)
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 8
        section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 20, bottom: 0, trailing: 20)
        return section
    }
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let event = dataSource.itemIdentifier(for: indexPath) else {
            return
        }
        
        let eventViewController = EventViewController()
        eventViewController.event = event
        
        navigationController?.pushViewController(eventViewController, animated: true)
    }
}

// MARK: - UISearchBarDelegate
extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        reloadData(with: searchText)
    }
}

// MARK: - SwiftUI
import SwiftUI

struct HomeVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let homeVC = HomeViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<ContainerView>) -> HomeViewController {
            return homeVC
        }
        
        func updateUIViewController(_ uiViewController: HomeVCProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<HomeVCProvider.ContainerView>) {
            
        }
    }
}
