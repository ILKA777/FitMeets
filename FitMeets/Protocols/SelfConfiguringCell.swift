//
//  SelfConfiguringCell.swift
//  FitMeets
//
//  Created by Илья Морин on 24.04.2023.
//

import UIKit

protocol SelfConfigureCell {
    static var reuseId: String { get }
    func configure(with value: MChat)
}
