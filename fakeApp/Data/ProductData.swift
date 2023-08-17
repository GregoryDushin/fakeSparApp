//
//  ProductData.swift
//  fakeApp
//
//  Created by Григорий Душин on 16.08.2023.
//

import Foundation
import UIKit

struct Section: Hashable {
    let sectionType: SectionType
    let items: [ListItem]
    let title: String?
}

enum SectionType {
    case horizontalCircle
    case horizontalPromo
    case horizontalBonuses
    case horizontalMenu
    case horizontalProducts
}

enum ListItem: Hashable {
    case horizontalCircleInfo(img: String , text: String)
    case horizontalPromoInfo(img: String)
    case horizontalBonusesInfo(img: String)
    case horizontalMenuInfo(img: String)
    case horizontalProductsInfo(img: String)
}
