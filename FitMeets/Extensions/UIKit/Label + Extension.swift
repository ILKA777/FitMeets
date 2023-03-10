//
//  Label + Extension.swift
//  FitMeets
//
//  Created by Илья Морин on 13.02.2023.
//

import UIKit

extension UILabel {
    
    convenience init(text: String, font: UIFont?, textColor: UIColor?) {
        self.init()
        
        self.text = text
        self.font = font
        self.textColor = textColor
    }
}
