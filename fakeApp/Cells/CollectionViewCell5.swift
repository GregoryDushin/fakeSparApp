//
//  CollectionViewCell5.swift
//  fakeApp
//
//  Created by Григорий Душин on 16.08.2023.
//

import UIKit

final class CollectionViewCell5: UICollectionViewCell {
    
    private var cell5Img: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    private func setupViews() {
        cell5Img = UIImageView()
        cell5Img.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(cell5Img)
        
        NSLayoutConstraint.activate(
            [
                cell5Img.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
                cell5Img.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
                cell5Img.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
                cell5Img.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0)
            ]
        )
    }
    
    func setup(img: String) {
        cell5Img.image = UIImage(named: img)
    }
}
