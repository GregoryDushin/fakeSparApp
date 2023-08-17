//
//  HeaderCollectionViewCell.swift
//  fakeApp
//
//  Created by Григорий Душин on 16.08.2023.
//

import UIKit

final class HeaderCollectionViewCell: UICollectionViewCell {
    
    private var headerLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    private func setupViews() {
        headerLabel = UILabel()
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(headerLabel)
        
        headerLabel.font = UIFont.systemFont(ofSize: 21.0, weight: .bold)
        
        NSLayoutConstraint.activate(
            [
                headerLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
                headerLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
                headerLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
                headerLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
                headerLabel.heightAnchor.constraint(equalToConstant: 21)
            ]
        )
    }

    func setup(header: String) {
        headerLabel.text = header
    }
}

