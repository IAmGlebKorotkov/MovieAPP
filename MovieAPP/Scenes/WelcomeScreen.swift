//
//  WelcomeScreen.swift
//  MovieAPP
//
//  Created by Gleb Korotkov on 16.10.2024.
//

import Foundation
import UIKit

class WelcomeScreen: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

       if let backgroundImage = UIImage(named: "Background") {
            let backgroundImageView = UIImageView(frame: self.view.bounds)
            backgroundImageView.image = backgroundImage
            backgroundImageView.contentMode = .scaleAspectFill
            self.view.insertSubview(backgroundImageView, at: 0)
        }
        
        
        let SignIn = RegularGradientButton(frame: CGRect(x: 24, y: 703, width: 345, height: 48))
        SignIn.configure(withTitle: "Войти в аккаунт")
        view.addSubview(SignIn)
        
        let Register = RegularJustButton(frame: CGRect(x: 24, y: 759, width: 345, height: 48))
        Register.configure(withTitle: "Зарегистрация", backgroundColor: .darkFaded)
        view.addSubview(Register)
        
        let label1Stroke = CustomLabel(x: 24, y: 100, fontSize: 18, textColor: .black)
        label1Stroke.text = "Добро пожаловать \n в MovieCatalog"
        label1Stroke.setPosition(x: 24, y: 76)
        label1Stroke.setFontSize(fontSize: 36)
        label1Stroke.setTextColor(textColor: .white)
        view.addSubview(label1Stroke)
        
        let label2Stroke = CustomLabel(x: 24, y: 100, fontSize: 18, textColor: .black)
        label2Stroke.text = "в MovieCatalog"
        label2Stroke.setPosition(x: 24, y: 115)
        label2Stroke.setFontSize(fontSize: 36)
        label2Stroke.setTextColor(textColor: .white)
        view.addSubview(label2Stroke)
    }
}
