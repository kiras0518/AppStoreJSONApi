//
//  BaseTabBarController.swift
//  AppStoreJSONApi
//
//  Created by kiras on 2019/11/24.
//  Copyright © 2019 ameyo. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        
        viewControllers = [
            creatNavController(viewController: AppsSearchController(), title: "Search", imageName: "search"),
            creatNavController(viewController: UIViewController(), title: "Today", imageName: "today_icon"),
            creatNavController(viewController: AppsController(), title: "Apps", imageName: "apps")
        ]
    }
    
    fileprivate func creatNavController(viewController: UIViewController, title: String, imageName: String) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: viewController)
        
        viewController.navigationItem.title = title
        viewController.view.backgroundColor = .white
        
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named: imageName)
        navController.navigationBar.prefersLargeTitles = true
        
        return navController
    }
    
}

