//
//  OneLineTextField.swift
//  FitMeets
//
//  Created by Илья Морин on 27.02.2023.
//

import UIKit

class OneLineTextField: UITextField {
    
    convenience init(font: UIFont? = .montserrat18(), color: UIColor? = .white, text: String? = "", textColor: UIColor? = .white) {
        self.init()
        self.font = font
        self.textColor = textColor
        let customPlaceholder = NSAttributedString(string: text ?? "",
                                                 attributes: [NSAttributedString.Key.foregroundColor: color])
        self.attributedPlaceholder = customPlaceholder
    
    
        
        self.borderStyle = .none
        self.translatesAutoresizingMaskIntoConstraints = false
        
        var bottomView = UIView()
        bottomView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0))
        bottomView.backgroundColor = .CustomGray()
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(bottomView)
        
        NSLayoutConstraint.activate([
            bottomView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            bottomView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 1)])
    }
}
