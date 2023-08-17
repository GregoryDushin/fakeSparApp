//
//  CollectionViewCell2.swift
//  fakeApp
//
//  Created by Григорий Душин on 16.08.2023.
//

import UIKit

final class CollectionViewCell2: UICollectionViewCell {
    
    private var promoImg: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    private func setupViews() {
        promoImg = UIImageView()
        promoImg.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(promoImg)
        
        NSLayoutConstraint.activate(
            [
                promoImg.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
                promoImg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
                promoImg.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
                promoImg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
            ]
        )
    }
    
    func setup(img: String) {
        promoImg.image = UIImage(named: img)
    }
}
