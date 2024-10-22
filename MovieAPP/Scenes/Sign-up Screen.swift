//
//  Sign-up Screen.swift
//  MovieAPP
//
//  Created by Gleb Korotkov on 19.10.2024.
//

import Foundation
import UIKit

class SignUpViewController: UIViewController {
    let passwordTextField = PasswordTextField()
    override func viewDidLoad() {
        super.viewDidLoad()
        if let backgroundImage = UIImage(named: "BackgroundRegister") {
             let backgroundImageView = UIImageView(frame: self.view.bounds)
             backgroundImageView.image = backgroundImage
             backgroundImageView.contentMode = .scaleAspectFill
             self.view.insertSubview(backgroundImageView, at: 0)
         }
        
        let label1Stroke = CustomLabel(x: 24, y: 110, fontSize: 18, textColor: .black)
        label1Stroke.text = "Регистрация"
        label1Stroke.setPosition(x: 100, y: 76)
        label1Stroke.setFontSize(fontSize: 24)
        label1Stroke.setTextColor(textColor: .white)
        view.addSubview(label1Stroke)
        
        let BackButton = IconButton(frame: CGRect(x: 40, y: 76, width: 40, height: 40))
        if let image = UIImage(named: "Chevron Left") {
            BackButton.configure(withImage: image, tintColor: .white)
            BackButton.setImageSize(size: CGSize(width: 30, height: 30))
        }
        view.addSubview(BackButton)
        
        let LoginField = PasswordTextField(frame: CGRect(x: 24, y: 343, width: 345, height: 48))
        LoginField.buttonType = .clear // или .clear, .eye
        LoginField.placeholder = "Логин"
        view.addSubview(LoginField)
        
        let MailField = PasswordTextField(frame: CGRect(x: 24, y: 399, width: 345, height: 48))
        MailField.buttonType = .clear // или .clear, .eye
        MailField.placeholder = "Электронная почта"
        view.addSubview(MailField)
        
        let NameField = PasswordTextField(frame: CGRect(x: 24, y: 455, width: 345, height: 48))
        NameField.buttonType = .clear // или .clear, .eye
        NameField.placeholder = "Имя"
        view.addSubview(NameField)
        
        let PasswordField = PasswordTextField(frame: CGRect(x: 24, y: 511, width: 345, height: 48))
        PasswordField.buttonType = .eye // или .clear, .eye
        PasswordField.placeholder = "Пароль"
        view.addSubview(PasswordField)
        
        let Password2Field = PasswordTextField(frame: CGRect(x: 24, y: 567, width: 345, height: 48))
        Password2Field.buttonType = .eye // или .clear, .eye
        Password2Field.placeholder = "Подтвердите пароль"
        view.addSubview(Password2Field)
        
        let DateField = PasswordTextField(frame: CGRect(x: 24, y: 623, width: 345, height: 48))
        DateField.buttonType = .calendar // или .clear, .eye
        DateField.placeholder = "Дата рождения"
        view.addSubview(DateField)
        
        let dualButtonView = DualButtonView()
        view.addSubview(dualButtonView)
        // Установите размеры и положение
        dualButtonView.translatesAutoresizingMaskIntoConstraints = false
        
        // Установите ограничения (Constraints)
        NSLayoutConstraint.activate([
            // Позиционирование по оси X
            dualButtonView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            // Позиционирование по оси Y
            dualButtonView.topAnchor.constraint(equalTo: view.topAnchor, constant: 679),
            // Задание ширины и высоты
            dualButtonView.widthAnchor.constraint(equalToConstant: 345),
            dualButtonView.heightAnchor.constraint(equalToConstant: 48)
        ])
        
        let ButtonLogin = RegularGradientButton(frame: CGRect(x: 24, y: 759, width: 345, height: 48))
        ButtonLogin.configure(withTitle: "Зарегестрироваться")
        view.addSubview(ButtonLogin)
    }
}

