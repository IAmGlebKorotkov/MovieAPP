//
//  Sign-in Screen.swift
//  MovieAPP
//
//  Created by Gleb Korotkov on 19.10.2024.
//

import Foundation

import Foundation
import UIKit

class SignUpViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        if let backgroundImage = UIImage(named: "BackgroundLogin") {
             let backgroundImageView = UIImageView(frame: self.view.bounds)
             backgroundImageView.image = backgroundImage
             backgroundImageView.contentMode = .scaleAspectFill
             self.view.insertSubview(backgroundImageView, at: 0)
         }
        
        let label1Stroke = CustomLabel(x: 24, y: 110, fontSize: 18, textColor: .black)
        label1Stroke.text = "Вход в аккаунт"
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
        

        let Login = ClearableTextField(frame: CGRect(x: 24, y: 623, width: 345, height: 48))
        view.addSubview(Login)
        
        let Password = ClearableTextField(frame: CGRect(x: 24, y: 680, width: 345, height: 48))
        view.addSubview(Password)
        
        let ButtonLogin = RegularJustButton(frame: CGRect(x: 24, y: 759, width: 345, height: 48))
        ButtonLogin.configure(withTitle: "Войти", backgroundColor: .darkFaded)
        view.addSubview(ButtonLogin)
    }
}
