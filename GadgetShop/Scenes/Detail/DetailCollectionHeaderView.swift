//
//  DetailCollectionViewHeaderView.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 24.12.2022.
//

import UIKit

class DetailCollectionHeaderView: UICollectionReusableView {
    
    private lazy var titleLalel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(label)
        return label
    }()
    
    // MARK: - View setup
    
    func fill(title: String) {
        titleLalel.text = title
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        titleLalel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        titleLalel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        titleLalel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
    }
}
