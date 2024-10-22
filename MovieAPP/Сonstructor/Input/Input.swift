//
//  Input.swift
//  MovieAPP
//
//  Created by Gleb Korotkov on 16.10.2024.
//

import Foundation
import UIKit

class PasswordTextField: UIView {
    
    enum ButtonType {
        case eye
        case calendar
        case clear
    }
    
    private let passwordTextField = UITextField()
    private let actionButton = UIButton(type: .system)
    
    private let eyeOpenImage = UIImage(named: "Eye")
    private let eyeClosedImage = UIImage(named: "Eye Off")
    private let calendarImage = UIImage(named: "Calendar")
    private let clearImage = UIImage(named: "Close")
    
    var buttonType: ButtonType = .eye {
        didSet {
            updateButtonAppearance()
        }
    }
    
    // Для форматирования даты
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        passwordTextField.isSecureTextEntry = false
        passwordTextField.textColor = .white
        passwordTextField.placeholder = "Пароль"
        passwordTextField.borderStyle = .none
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        addSubview(passwordTextField)
        
        actionButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        actionButton.tintColor = .white
        actionButton.isHidden = true

        addSubview(actionButton)
        
        backgroundColor = .darkFaded
        layer.cornerRadius = 8
        
        // Установим начальный тип кнопки
        updateButtonAppearance()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            passwordTextField.centerYAnchor.constraint(equalTo: centerYAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: actionButton.leadingAnchor, constant: -8),
            
            actionButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            actionButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            actionButton.widthAnchor.constraint(equalToConstant: 24),
            actionButton.heightAnchor.constraint(equalToConstant: 24),
            
            heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    @objc private func textFieldDidChange(_ textField: UITextField) {
        if let text = textField.text, !text.isEmpty {
            actionButton.isHidden = false
        } else {
            actionButton.isHidden = true
        }
    }

    
    private func updateButtonAppearance() {
        switch buttonType {
        case .eye:
            let image = passwordTextField.isSecureTextEntry ? eyeClosedImage : eyeOpenImage
            actionButton.setImage(image, for: .normal)
        case .calendar:
            actionButton.setImage(calendarImage, for: .normal)
        case .clear:
            actionButton.setImage(clearImage, for: .normal)
        }
    }
    
    public var placeholder: String? {
        get {
            return passwordTextField.placeholder
        }
        set {
            if let placeholderText = newValue {
                passwordTextField.attributedPlaceholder = NSAttributedString(
                    string: placeholderText,
                    attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
                )
            } else {
                passwordTextField.attributedPlaceholder = nil
            }
        }
    }
    
    
    @objc private func buttonAction() {
        switch buttonType {
        case .eye:
            togglePasswordVisibility()
        case .calendar:
            showDatePicker()
        case .clear:
            clearTextField()
        }
    }
    
    private func togglePasswordVisibility() {
        passwordTextField.isSecureTextEntry.toggle()
        let image = passwordTextField.isSecureTextEntry ? eyeClosedImage : eyeOpenImage
        actionButton.setImage(image, for: .normal)
    }
    
    private func showDatePicker() {
        // Создаем датапикер
        let datePicker = UIDatePicker()

        datePicker.datePickerMode = .date
        
        // Создаем алерт контроллер
        let alertController = UIAlertController(title: "Выберите дату", message: nil, preferredStyle: .actionSheet)
        
        // Добавляем датапикер в алерт контроллер
        alertController.view.addSubview(datePicker)
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.leadingAnchor.constraint(equalTo: alertController.view.leadingAnchor).isActive = true
        datePicker.trailingAnchor.constraint(equalTo: alertController.view.trailingAnchor).isActive = true
        datePicker.topAnchor.constraint(equalTo: alertController.view.topAnchor, constant: 50).isActive = true
        datePicker.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        // Добавляем кнопку "Готово"
        alertController.addAction(UIAlertAction(title: "Готово", style: .default, handler: { [weak self] _ in
            let selectedDate = datePicker.date
            self?.passwordTextField.text = self?.dateFormatter.string(from: selectedDate)
        }))
        
        // Кнопка "Отмена"
        alertController.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
        
        // Изменяем высоту алерт контроллера
        let height = NSLayoutConstraint(item: alertController.view!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 300)
        alertController.view.addConstraint(height)
        
        // Находим верхний контроллер для отображения алерта
        if let topController = UIApplication.shared.keyWindow?.rootViewController {
            topController.present(alertController, animated: true, completion: nil)
        }
    }
    
    private func clearTextField() {
        passwordTextField.text = ""
    }
}
