//
//  DetailCapasityCollectionViewCell.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 11.01.2023.
//

import UIKit

class DetailCapasityCollectionViewCell: UICollectionViewCell {
    
    private lazy var titleLabel = {
        let label = UILabel(frame: self.frame)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        label.font = UIFont(name: .markProBold, size: 12)
        label.textColor = .systemGray
        label.textAlignment = .center
        addSubview(label)
        label.topAnchor.constraint(equalTo: topAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        label.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        label.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        return label
    }()
    
    // MARK: - Public funcs
    
    func fill(title: String?) {
        titleLabel.text = title?.appending(" GB")
        setNeedsUpdateConstraints()
    }
    
    func set(selected: Bool) {
        if selected {
            titleLabel.backgroundColor = UIColor.CustomColor.orange.uiColor
            titleLabel.textColor = .white
        } else {
            titleLabel.backgroundColor = .clear
            titleLabel.textColor = .systemGray
        }
    }
}
