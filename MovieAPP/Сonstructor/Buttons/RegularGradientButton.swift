//
//  RegularButton.swift
//  MovieAPP
//
//  Created by Gleb Korotkov on 16.10.2024.
//

import Foundation

import UIKit

class RegularGradientButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    private func setupButton() {
        setTitleColor(.white, for: .normal)
        layer.cornerRadius = 10
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.25
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 10
        
        // Применение градиента
        applyGradient(colors: [UIColor.accent.cgColor, UIColor.accentGradient.cgColor])
    }
    func configure(withTitle title: String) {
        setTitle(title, for: .normal)
    }
    private func applyGradient(colors: [CGColor]) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.frame = self.bounds

        gradientLayer.cornerRadius = self.layer.cornerRadius
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.sublayers?.first?.frame = self.bounds
    }
}

