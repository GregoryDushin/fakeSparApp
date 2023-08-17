//
//  SceneDelegate.swift
//  fakeApp
//
//  Created by Григорий Душин on 16.08.2023.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
      
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        
        let tabBarController = UITabBarController()
        
        tabBarController.tabBar.backgroundColor = UIColor.systemGray6
        tabBarController.tabBar.tintColor = .systemGreen

        let firstViewController = ViewController()
        let secondViewController = SecondViewController()
        let thirdViewController = ThirdViewController()
        let fourthViewController = FourthViewController()


        let image1 = UIImage(named: TabBarImgs.firstVC)?.withRenderingMode(.alwaysOriginal)
        let image2 = UIImage(named: TabBarImgs.secondVC)?.withRenderingMode(.alwaysOriginal)
        let image3 = UIImage(named: TabBarImgs.thirdVC)?.withRenderingMode(.alwaysOriginal)
        let image4 = UIImage(named: TabBarImgs.fourthVC)?.withRenderingMode(.alwaysOriginal)

        firstViewController.tabBarItem = UITabBarItem(title: TabBarTitles.firstVC, image: image1, tag: 0)

        secondViewController.tabBarItem = UITabBarItem(title: TabBarTitles.secondVC, image: image2, tag: 1)

        thirdViewController.tabBarItem = UITabBarItem(title: TabBarTitles.thirdVC, image: image3, tag: 2)

        fourthViewController.tabBarItem = UITabBarItem(title: TabBarTitles.fourthVC, image: image4, tag: 3)

        tabBarController.viewControllers = [firstViewController, secondViewController, thirdViewController, fourthViewController]

        window.rootViewController = tabBarController
        self.window = window
        
        window.makeKeyAndVisible()
    }
}
