//
//  ViewController.swift
//  MovieAPP
//
//  Created by Gleb Korotkov on 16.10.2024.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let iconButton = IconButton(frame: CGRect(x: 0, y: 200, width: 40, height: 40))
        if let image = UIImage(systemName: "chevron.left") {
            iconButton.configure(withImage: image, tintColor: .white)
            iconButton.setImageSize(size: CGSize(width: 30, height: 30))
        }
        view.addSubview(iconButton)
        
        /*
        let RegButton = RegularButton(frame: CGRect(x: 0, y: 100, width: 364, height: 48))
        RegButton.configure(withTitle: "Нажми меня")
        view.addSubview(RegButton)"
        */
        /*
         let dualButtonView = DualButtonView()
         view.addSubview(dualButtonView)
         // Установите размеры и положение
         dualButtonView.translatesAutoresizingMaskIntoConstraints = false
         
         // Установите ограничения (Constraints)
         NSLayoutConstraint.activate([
         dualButtonView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
         dualButtonView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
         dualButtonView.widthAnchor.constraint(equalToConstant: 300),
         dualButtonView.heightAnchor.constraint(equalToConstant: 50)
         ])
         */
        
        // Создаем объект нашего кастомного поля с кнопкой
        // Устанавливаем цвет фона для примера
        view.backgroundColor = .darkGray
        /*
         // Создаем объект нашего кастомного поля с кнопкой/знаком
         let textFieldWithIcon = InputWithIcon()
         
         textFieldWithIcon.translatesAutoresizingMaskIntoConstraints = false
         
         view.addSubview(textFieldWithIcon)
         
         // Добавляем ограничения для трех экземпляров
         NSLayoutConstraint.activate([
         textFieldWithIcon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
         textFieldWithIcon.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
         textFieldWithIcon.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
         textFieldWithIcon.heightAnchor.constraint(equalToConstant: 50)])
         }*/
        let customTabBarController = CustomTabBarController()
        
        // Добавляем TabBarController как дочерний контроллер
        addChild(customTabBarController)
        view.addSubview(customTabBarController.view)
        customTabBarController.didMove(toParent: self)
    }
}
