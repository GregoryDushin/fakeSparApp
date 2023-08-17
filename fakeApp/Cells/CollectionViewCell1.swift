//
//  CollectionViewCell1.swift
//  fakeApp
//
//  Created by Григорий Душин on 16.08.2023.
//

import UIKit

final class CollectionViewCell1: UICollectionViewCell {
    
    private var startImg: UIImageView!
    private var label: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    private func setupViews() {
        startImg = UIImageView()
        startImg.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(startImg)
        
        label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        contentView.addSubview(label)
        
        NSLayoutConstraint.activate(
            [
                startImg.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
                startImg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
                startImg.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
                startImg.widthAnchor.constraint(equalToConstant: 90),
                startImg.heightAnchor.constraint(equalToConstant: 90),
                
                label.topAnchor.constraint(equalTo: startImg.bottomAnchor, constant: 3),
                label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
                label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
                label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0)
            ]
        )
    }
    
    func setup(img: String, labelText: String) {
        startImg.image = UIImage(named: img)
        label.text = labelText
    }
}
