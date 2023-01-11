//
//  DetailColorCell.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 24.12.2022.
//

import UIKit

class DetailColorCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = frame.width / 2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func fill(hexColor: String?) {
        guard let hexColor = hexColor else { return }
        backgroundColor = UIColor(hexColor)
        setNeedsLayout()
    }
}
