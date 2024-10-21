//
//  IconButton.swift
//  MovieAPP
//
//  Created by Gleb Korotkov on 16.10.2024.
//

import Foundation

import UIKit

class IconButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    private func setupButton() {
        backgroundColor = .dark
        layer.cornerRadius = 10
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.25
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 10
    }

    // Метод для настройки иконки
    func configure(withImage image: UIImage?, tintColor: UIColor) {
        setImage(image, for: .normal)
        setImage(image?.withRenderingMode(.alwaysTemplate), for: .normal)
        self.tintColor = tintColor // Цвет иконки
        contentHorizontalAlignment = .center
        contentVerticalAlignment = .center
    }

    func setImageSize(size: CGSize) {
        imageView?.contentMode = .scaleAspectFit
        let imageInsets = UIEdgeInsets(top: (frame.size.height - size.height) / 2,
                                        left: (frame.size.width - size.width) / 2,
                                        bottom: (frame.size.height - size.height) / 2,
                                        right: (frame.size.width - size.width) / 2)
        self.imageEdgeInsets = imageInsets
    }
}
