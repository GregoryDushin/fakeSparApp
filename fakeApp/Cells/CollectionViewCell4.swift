//
//  CollectionViewCell4.swift
//  fakeApp
//
//  Created by Григорий Душин on 16.08.2023.
//

import UIKit

final class CollectionViewCell4: UICollectionViewCell {
    
    private var cell4Img: UIImageView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }

    private func setupViews() {
        cell4Img = UIImageView()
        cell4Img.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(cell4Img)

        NSLayoutConstraint.activate(
            [
                cell4Img.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
                cell4Img.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
                cell4Img.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
                cell4Img.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0)
            ]
        )
    }

    func setup(img: String) {
        cell4Img.image = UIImage(named: img)
    }
}
