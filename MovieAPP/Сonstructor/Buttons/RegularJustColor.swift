//
//  RegularJustColor.swift
//  MovieAPP
//
//  Created by Gleb Korotkov on 17.10.2024.
//

import Foundation
import UIKit

class RegularJustButton: UIButton {

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
        backgroundColor = .systemBlue
        layer.cornerRadius = 10
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.25
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 10
    }

    func configure(withTitle title: String, backgroundColor: UIColor) {
        setTitle(title, for: .normal)
        self.backgroundColor = backgroundColor
    }
}


