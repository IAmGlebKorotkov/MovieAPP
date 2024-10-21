//
//  DoubleButton.swift
//  MovieAPP
//
//  Created by Gleb Korotkov on 16.10.2024.
//

import Foundation

import UIKit

import UIKit

class DualButtonView: UIView {

    let leftButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Left", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()

    let rightButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Right", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .darkFaded
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButtons()
    }

    private func setupButtons() {
        addSubview(leftButton)
        addSubview(rightButton)
        
        leftButton.translatesAutoresizingMaskIntoConstraints = false
        rightButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            leftButton.topAnchor.constraint(equalTo: self.topAnchor),
            leftButton.leftAnchor.constraint(equalTo: self.leftAnchor),
            leftButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            leftButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5),
            
            rightButton.topAnchor.constraint(equalTo: self.topAnchor),
            rightButton.rightAnchor.constraint(equalTo: self.rightAnchor),
            rightButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            rightButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5)
        ])
        
        applyRoundedCorners()
    }

    private func applyRoundedCorners() {
        applyGradient(to: leftButton, colors: [UIColor.accent.cgColor, UIColor.accentGradient.cgColor])
        
        let leftPath = UIBezierPath(roundedRect: leftButton.bounds,
                                    byRoundingCorners: [.topLeft, .bottomLeft],
                                    cornerRadii: CGSize(width: 10, height: 10))
        let leftMask = CAShapeLayer()
        leftMask.path = leftPath.cgPath
        leftButton.layer.mask = leftMask

        // Скругление только правых краёв для правой кнопки
        let rightPath = UIBezierPath(roundedRect: rightButton.bounds,
                                     byRoundingCorners: [.topRight, .bottomRight],
                                     cornerRadii: CGSize(width: 10, height: 10))
        let rightMask = CAShapeLayer()
        rightMask.path = rightPath.cgPath
        rightButton.layer.mask = rightMask
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        applyRoundedCorners()
    }
    
    private func applyGradient(to button: UIButton, colors: [CGColor]) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = button.bounds
        gradientLayer.colors = colors
        button.layer.insertSublayer(gradientLayer, at: 0)
    }
}
