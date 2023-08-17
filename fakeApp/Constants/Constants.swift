//
//  Constants.swift
//  fakeApp
//
//  Created by Григорий Душин on 16.08.2023.
//

import Foundation
import UIKit

struct Constants {
    static let circleName = ["Мой SPAR", "Соцсети", "KLERN", "Мед", "Рецепты"]
    static let circleImg = ["circle1", "circle2", "circle3", "circle4", "circle5"]
    static let menuImg = ["menu1", "menu2", "menu3", "menu4","menu5","menu6"]
    static let prodImg = ["prod1", "prod2", "prod3", "prod4", "prod5"]
    static let sweetProdImg = ["sweetProd1", "sweetProd2", "sweetProd3", "sweetProd4", "sweetProd5"]
    static let promoImg = ["promo1", "promo2", "promo3"]
    static let bonusesImg = ["bonuses"]
    static let headers = ["Рекомендуем","Сладкая жизнь"]
}

enum TabBarImgs {
    static let firstVC = "home"
    static let secondVC = "menu"
    static let thirdVC = "basket"
    static let fourthVC = "profile"
}

enum TabBarTitles {
    static let firstVC = "Главная"
    static let secondVC = "Каталог"
    static let thirdVC = "Корзина"
    static let fourthVC = "Профиль"
}

enum RegisterCell {
    static let firstCell = "CollectionViewCell1"
    static let secondCell = "CollectionViewCell2"
    static let thirdCell = "CollectionViewCell3"
    static let fourthCell = "CollectionViewCell4"
    static let fifthCell = "CollectionViewCell5"
    static let headerCell = "HeaderCollectionViewCell"
}

enum Colors {
    static let green = ""
    static let secondCell = "CollectionViewCell2"
    static let thirdCell = "CollectionViewCell3"
    static let fourthCell = "CollectionViewCell4"
    static let fifthCell = "CollectionViewCell5"
    static let headerCell = "HeaderCollectionViewCell"
}

enum TopViewConstants {
    static let city = "Москва и Московская область"
    static let image = "navigation"
    static let button = "line.3.horizontal"
}

 //MARK: ViewControllers for initializing fake tabBar

class SecondViewController: UIViewController{
    
}

class ThirdViewController: UIViewController{
    
}

class FourthViewController: UIViewController{
    
}
