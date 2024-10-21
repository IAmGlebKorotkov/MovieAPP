//
//  NavigationBar.swift
//  MovieAPP
//
//  Created by Gleb Korotkov on 16.10.2024.
//

import Foundation


import UIKit

class TabBarView: UIView{
    var onDidSelectTab: ((_ index: Int) -> Void)?
}


class CustomTabBarController: UITabBarController {
    let tabbarView = TabBarView()
    override func viewDidLoad() {
        super.viewDidLoad()
        /*tabbarView.onDidSelectTab = {[weak self] index in
            self?.selectedIndex = index
        }*/
        let feedVC = UIViewController()
        feedVC.view.backgroundColor = .white
        feedVC.tabBarItem = UITabBarItem(title: "Лента", image: UIImage(systemName: "list.bullet"), selectedImage: UIImage(systemName: "list.bullet"))

        let moviesVC = UIViewController()
        moviesVC.view.backgroundColor = .white
        moviesVC.tabBarItem = UITabBarItem(title: "Фильмы", image: UIImage(systemName: "film"), selectedImage: UIImage(systemName: "film.fill"))

        let favoritesVC = UIViewController()
        favoritesVC.view.backgroundColor = .white
        favoritesVC.tabBarItem = UITabBarItem(title: "Избранное", image: UIImage(systemName: "books.vertical"), selectedImage: UIImage(systemName: "books.vertical.fill"))

        let profileVC = UIViewController()
        profileVC.view.backgroundColor = .white
        profileVC.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))

        self.viewControllers = [feedVC, moviesVC, favoritesVC, profileVC]

        tabBar.backgroundColor = .darkFaded
        tabBar.tintColor = UIColor.orange
        tabBar.unselectedItemTintColor = UIColor.lightGray

        tabBar.layer.cornerRadius = 20
        tabBar.layer.masksToBounds = true
        tabBar.frame.origin.y = view.frame.height - tabBar.frame.height - 10
        self.selectedIndex = 3
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tabBar.frame.size.height = 64
        tabBar.frame.size.width = 364
        tabBar.frame.origin.y = view.frame.height - tabBar.frame.height - 10
        tabBar.layer.cornerRadius = 16
    }
}
