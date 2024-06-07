//
//  TabBarController.swift
//  NewsMobileApp
//
//  Created by Aldana Rastrelli on 05/06/2024.
//

import UIKit

final class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newsViewController = PostsFeedModule.build()
        newsViewController.tabBarItem = UITabBarItem(title: "Feed", image: UIImage(systemName: "newspaper"), selectedImage: UIImage(systemName: "newspaper.fill"))
        let newsNavController = UINavigationController(rootViewController: newsViewController)
        
        let friendsViewController = FriendsViewModule.build()
        friendsViewController.tabBarItem = UITabBarItem(title: "Friends", image: UIImage(systemName: "person.2"), selectedImage: UIImage(systemName: "person.2.fill"))
        let friendsNavController = UINavigationController(rootViewController: friendsViewController)
        
        self.viewControllers = [newsNavController, friendsNavController]
    }
}
