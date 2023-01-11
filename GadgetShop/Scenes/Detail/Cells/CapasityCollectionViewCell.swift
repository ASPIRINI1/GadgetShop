//
//  CapasityCollectionViewCell.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 11.01.2023.
//

import UIKit

class CapasityCollectionViewCell: UICollectionViewCell {
    
    private lazy var titleLabel = {
        let label = UILabel(frame: self.frame)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        label.font = UIFont(name: .markProBold, size: 12)
        label.textColor = .systemGray5
        label.textAlignment = .center
        addSubview(label)
        return label
    }()
    
    func fill(title: String?) {
        titleLabel.text = title?.appending(" GB")
        setNeedsUpdateConstraints()
        set(selected: true)
    }
    
    func set(selected: Bool) {
        if selected {
            titleLabel.backgroundColor = UIColor.CustomColor.orange.uiColor
            titleLabel.textColor = .white
        } else {
            titleLabel.backgroundColor = .clear
            titleLabel.textColor = .systemGray5
        }
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        titleLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
}
