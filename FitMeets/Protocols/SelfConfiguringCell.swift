//
//  SelfConfiguringCell.swift
//  FitMeets
//
//  Created by Илья Морин on 24.04.2023.
//

import UIKit

protocol SelfConfiguringCell {
    static var reuseId: String { get }
    func configure<U: Hashable>(with value: U)
}
