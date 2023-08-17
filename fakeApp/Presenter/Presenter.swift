//
//  Presenter.swift
//  fakeApp
//
//  Created by Григорий Душин on 16.08.2023.
//

import Foundation
import UIKit

protocol MarketViewProtocol: AnyObject {
    func presentSections(data: [Section])
}

protocol MarketPresenterProtocol: AnyObject {
    var view: MarketViewProtocol? { get set }
    func getData()
}

final class MarketPresenter: MarketPresenterProtocol {
    
    weak var view: MarketViewProtocol?
  
    func getData() {
        
        let sections = [
            Section(
                sectionType: .horizontalCircle,
                items: [
                    .horizontalCircleInfo(img: Constants.circleImg[0], text: Constants.circleName[0]),
                    .horizontalCircleInfo(img: Constants.circleImg[1], text: Constants.circleName[1]),
                    .horizontalCircleInfo(img: Constants.circleImg[2], text: Constants.circleName[2]),
                    .horizontalCircleInfo(img: Constants.circleImg[3], text: Constants.circleName[3]),
                    .horizontalCircleInfo(img: Constants.circleImg[4], text: Constants.circleName[4])
                ],
                title: nil
            ),
            Section(
                sectionType: .horizontalPromo,
                items: [
                    .horizontalPromoInfo(img: Constants.promoImg[0]),
                    .horizontalPromoInfo(img: Constants.promoImg[1]),
                    .horizontalPromoInfo(img: Constants.promoImg[2])
                ],
                title: nil
            ),
            Section(
                sectionType: .horizontalBonuses,
                items: [
                    .horizontalBonusesInfo(img: Constants.bonusesImg[0])
                ],
                title: nil
            ),
            Section(
                sectionType: .horizontalMenu,
                items: [
                    .horizontalMenuInfo(img: Constants.menuImg[0]),
                    .horizontalMenuInfo(img: Constants.menuImg[1]),
                    .horizontalMenuInfo(img: Constants.menuImg[2]),
                    .horizontalMenuInfo(img: Constants.menuImg[3]),
                    .horizontalMenuInfo(img: Constants.menuImg[4]),
                    .horizontalMenuInfo(img: Constants.menuImg[5])
                    
                ],
                title: nil
            ),
            Section(
                sectionType: .horizontalProducts,
                items: [
                    .horizontalProductsInfo(img: Constants.prodImg[0]),
                    .horizontalProductsInfo(img: Constants.prodImg[1]),
                    .horizontalProductsInfo(img: Constants.prodImg[2]),
                    .horizontalProductsInfo(img: Constants.prodImg[3]),
                    .horizontalProductsInfo(img: Constants.prodImg[4])
                ],
                title: Constants.headers[0]
            ),
            Section(
                sectionType: .horizontalProducts,
                items: [
                    .horizontalProductsInfo(img: Constants.sweetProdImg[0]),
                    .horizontalProductsInfo(img: Constants.sweetProdImg[1]),
                    .horizontalProductsInfo(img: Constants.sweetProdImg[2]),
                    .horizontalProductsInfo(img: Constants.sweetProdImg[3]),
                    .horizontalProductsInfo(img: Constants.sweetProdImg[4])
                ],
                title: Constants.headers[1]
            )
        ]
        
        self.view?.presentSections(data: sections)
    }
}
