//
//  InsertableTextField.swift
//  FitMeets
//
//  Created by Илья Морин on 07.05.2023.
//

import UIKit

class InsertableTextField: UITextField {
    
    var placeholderTextColor: UIColor? {
        didSet {
            updatePlaceholderTextColor()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        updatePlaceholderTextColor()
        clearButtonMode = .whileEditing
        font = UIFont.systemFont(ofSize: 14)
        borderStyle = .none
        layer.cornerRadius = 18
        layer.masksToBounds = true
        
        
        if let image = UIImage(systemName: "smiley") {
            let tintedImage = image.withTintColor(.CustomYellowGreen(), renderingMode: .alwaysTemplate)
            
            let imageView = UIImageView(image: tintedImage)
            imageView.tintColor = .CustomYellowGreen()
            
            leftView = imageView
            leftView?.frame = CGRect(x: 0, y: 0, width: 19, height: 19)
            leftViewMode = .always
        }
        textColor = .white
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "Sent"), for: .normal)
        
        rightView = button
        rightView?.frame = CGRect(x: 0, y: 0, width: 19, height: 19)
        rightViewMode = .always
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 36, dy: 0)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 36, dy: 0)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 36, dy: 0)
    }
    
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.leftViewRect(forBounds: bounds)
        rect.origin.x += 12
        return rect
    }
    
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.rightViewRect(forBounds: bounds)
        rect.origin.x += -12
        return rect
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
        updatePlaceholderTextColor()
    }
    
    private func updatePlaceholderTextColor() {
        guard let placeholderText = self.placeholder, let color = placeholderTextColor else { return }
        
        let attributedPlaceholder = NSAttributedString(
            string: placeholderText,
            attributes: [NSAttributedString.Key.foregroundColor: color]
        )
        self.attributedPlaceholder = attributedPlaceholder
    }
}


// MARK: - SwiftUI
import SwiftUI

struct TextFieldProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let profileVC = ProfileViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<TextFieldProvider.ContainerView>) -> ProfileViewController{
            return profileVC
        }
        
        func updateUIViewController(_ uiViewController: TextFieldProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<TextFieldProvider.ContainerView>) {
            
        }
    }
}
