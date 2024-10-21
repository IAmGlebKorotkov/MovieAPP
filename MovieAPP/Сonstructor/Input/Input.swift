//
//  Input.swift
//  MovieAPP
//
//  Created by Gleb Korotkov on 16.10.2024.
//

import Foundation
import UIKit

import UIKit

class ClearableTextField: UITextField {
    
    // Создаем кнопку
    private let clearButton = UIButton(type: .custom)

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    // Настраиваем текстовое поле и кнопку
    private func setup() {
        self.backgroundColor = UIColor.darkFaded
        // Настройка кнопки
        clearButton.setImage(UIImage(named: "Close"), for: .normal) // иконка из SF Symbols
        clearButton.addTarget(self, action: #selector(clearText), for: .touchUpInside)
        // Установка кнопки как rightView
        rightView = clearButton
        rightViewMode = .always

        // Дополнительные параметры текстового поля
        self.borderStyle = .roundedRect
        self.placeholder = "Введите текст"
        self.textColor = UIColor.white
    }

    // Действие кнопки очистки
    @objc private func clearText() {
        self.text = ""
    }

    // Регулировка размера кнопки
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        let size = CGSize(width: 24, height: 24)
        let origin = CGPoint(x: bounds.width - size.width - 10, y: (bounds.height - size.height) / 2) // Отступ от правого края
        return CGRect(origin: origin, size: size)
    }
}
