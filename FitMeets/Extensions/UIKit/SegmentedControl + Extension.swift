//
//  SegmentedControl + Extension.swift
//  FitMeets
//
//  Created by Илья Морин on 07.03.2023.
//

import UIKit

extension UISegmentedControl {
    
    convenience init(first: String, second: String) {
        self.init()
        self.insertSegment(withTitle: first, at: 0, animated: true)
        self.insertSegment(withTitle: second, at: 1, animated: true)
        self.selectedSegmentIndex = 0
        
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.CustomYellowGreen()]
        self.setTitleTextAttributes(titleTextAttributes, for:.normal)

        let titleTextAttributes1 = [NSAttributedString.Key.foregroundColor: UIColor.black]
        self.setTitleTextAttributes(titleTextAttributes1, for:.selected)
        
    }
    
    convenience init(first: String, second: String, third: String) {
        self.init()
        self.insertSegment(withTitle: first, at: 0, animated: true)
        self.insertSegment(withTitle: second, at: 1, animated: true)
        self.insertSegment(withTitle: third, at: 2, animated: true)
        self.selectedSegmentIndex = 0
        
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.CustomYellowGreen()]
        self.setTitleTextAttributes(titleTextAttributes, for:.normal)

        let titleTextAttributes1 = [NSAttributedString.Key.foregroundColor: UIColor.black]
        self.setTitleTextAttributes(titleTextAttributes1, for:.selected)
        
    }
}
