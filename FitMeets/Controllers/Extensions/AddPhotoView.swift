//  AddPhotoView.swift
//  FitMeets
//
//  Created by Илья Морин on 05.03.2023.
//

import UIKit

class AddPhotoView: UIView {
    
    var circleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "Vector.svg")
        imageView.clipsToBounds = false
        return imageView
    }()
    
    var circleImageViewTwo: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .CustomBlue()
        imageView.clipsToBounds = false
        imageView.layer.borderWidth = 2
        return imageView
    }()
    
    
    let plusButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        let myImage = UIImage(named: "plus.png")
        button.setImage(myImage, for: .normal)
        button.tintColor = .white
        return button
        
        
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(circleImageViewTwo)
        circleImageViewTwo.addSubview(circleImageView)
        addSubview(plusButton)
        SetupConstraints()
    }
    
    
    private func SetupConstraints() {
        circleImageView.center = CGPoint(x: circleImageViewTwo.bounds.width / 2, y: circleImageViewTwo.bounds.height / 2)
        
        NSLayoutConstraint.activate([
            circleImageViewTwo.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            circleImageViewTwo.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            
            circleImageViewTwo.widthAnchor.constraint(equalToConstant: 170),
            circleImageViewTwo.heightAnchor.constraint(equalToConstant: 170)
        ])
        
        NSLayoutConstraint.activate([
            plusButton.leadingAnchor.constraint(equalTo: circleImageViewTwo.trailingAnchor, constant: 16),
            plusButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            plusButton.widthAnchor.constraint(equalToConstant: 30),
            plusButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            circleImageView.centerXAnchor.constraint(equalTo: circleImageViewTwo.centerXAnchor),
            circleImageView.centerYAnchor.constraint(equalTo: circleImageViewTwo.centerYAnchor),
            circleImageView.widthAnchor.constraint(equalToConstant: 100),
            circleImageView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        self.bottomAnchor.constraint(equalTo: circleImageViewTwo.bottomAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: plusButton.trailingAnchor).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        circleImageView.layer.masksToBounds = true
        circleImageView.layer.cornerRadius = circleImageView.bounds.height / 2
        circleImageViewTwo.layer.masksToBounds = true
        circleImageViewTwo.layer.cornerRadius = circleImageViewTwo.frame.width / 2
    }
    
}
