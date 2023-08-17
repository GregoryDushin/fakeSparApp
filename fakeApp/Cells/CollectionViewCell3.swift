//
//  CollectionViewCell3.swift
//  fakeApp
//
//  Created by Григорий Душин on 16.08.2023.
//

import UIKit

final class CollectionViewCell3: UICollectionViewCell {
    
    private var cell3Img: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    private func setupViews() {
        cell3Img = UIImageView()
        cell3Img.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(cell3Img)
        
        NSLayoutConstraint.activate(
            [
                cell3Img.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
                cell3Img.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
                cell3Img.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
                cell3Img.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            ]
        )
    }
    
    func setup(img: String) {
        cell3Img.image = UIImage(named: img)
    }
}

