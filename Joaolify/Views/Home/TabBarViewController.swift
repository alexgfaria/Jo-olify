//
//  TabBarViewController.swift
//  Joaolify
//
//  Created by Alex Faria on 16/10/2022.
//

import UIKit

class TabBar: UITabBarController {

    enum Constants {

        static let ViewControllerTitle = "Joãolify"
    }

    override func viewDidLoad() {

        super.viewDidLoad()

        overrideUserInterfaceStyle = .dark
        self.tabBar.isHidden = true

        setupViewControllers()
    }

    private func createNavController(for rootViewController: UIViewController,
                                     title: String) -> UIViewController {

        let navController = UINavigationController(rootViewController: rootViewController)

        navController.tabBarItem.title = title
        navController.navigationBar.prefersLargeTitles = true

        return navController
    }

    private func setupViewControllers() {

        viewControllers = [

            createNavController(for: ViewController(),
                                title: Constants.ViewControllerTitle)
        ]
    }

}
