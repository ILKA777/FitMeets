//
//  UIViewController + Extension.swift
//  FitMeets
//
//  Created by Илья Морин on 01.05.2023.
//

import UIKit

extension UIViewController {
    func configure<T: SelfConfiguringCell, U: Hashable>(collectionView: UICollectionView,cellType: T.Type, with value: U, for indexPath: IndexPath) -> T {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.reuseId, for: indexPath) as? T else { fatalError("Unable to deque \(cellType)")}
        cell.configure(with: value)
        return cell
    }
}
