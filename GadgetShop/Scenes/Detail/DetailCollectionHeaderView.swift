//
//  DetailCollectionViewHeaderView.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 24.12.2022.
//

import UIKit

class DetailCollectionHeaderView: UICollectionReusableView {
    
    // MARK: Private properties
    
    private lazy var titleLalel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(label)
        label.topAnchor.constraint(equalTo: topAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        label.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        return label
    }()
    
    // MARK: - Public funcs
    
    func fill(title: String) {
        titleLalel.text = title
    }
}
