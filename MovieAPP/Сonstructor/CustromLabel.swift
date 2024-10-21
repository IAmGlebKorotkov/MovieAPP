//
//  CustromLabel.swift
//  MovieAPP
//
//  Created by Gleb Korotkov on 18.10.2024.
//

import Foundation
import UIKit

import UIKit

class CustomLabel: UILabel {

    // Инициализация с параметрами
    init(x: CGFloat, y: CGFloat, fontSize: CGFloat, textColor: UIColor) {
        super.init(frame: CGRect(x: x, y: y, width: 0, height: 0))
        self.font = UIFont.systemFont(ofSize: fontSize)
        self.textColor = textColor
        //self.sizeToFit() // Установим размер в соответствии с содержимым
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setPosition(x: CGFloat, y: CGFloat) {
        self.frame.origin = CGPoint(x: x, y: y)
    }


    func setFontSize(fontSize: CGFloat) {
        self.font = UIFont.systemFont(ofSize: fontSize)
        self.sizeToFit()
    }


    func setTextColor(textColor: UIColor) {
        self.textColor = textColor
    }
}
