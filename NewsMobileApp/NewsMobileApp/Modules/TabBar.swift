//
//  TabBar.swift
//  NewsMobileApp
//
//  Created by Aldana Rastrelli on 05/06/2024.
//

import UIKit

final class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newsViewController = UIViewController() // TODO change this to news
        newsViewController.tabBarItem = UITabBarItem(title: "Feed", image: UIImage(systemName: "newspaper"), selectedImage: UIImage(systemName: "newspaper.fill"))
        
        let friendsViewController = UIViewController() // TODO change this to friends
        friendsViewController.tabBarItem = UITabBarItem(title: "Friends", image: UIImage(systemName: "person.2"), selectedImage: UIImage(systemName: "person.2.fill"))
        
        self.viewControllers = [newsViewController, friendsViewController]
    }
}
