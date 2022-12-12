//
//  HeaderCollectionViewCell.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 12.12.2022.
//

import UIKit

class HeaderCollectionViewCell: UICollectionViewCell {
    
    private lazy var geoButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setImage(UIImage(named: <#T##String#>), for: .normal)
        
        return button
    }()
    private lazy var filterButtonnButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "filler"), for: .normal)
        return button
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubview(geoButton)
        addSubview(filterButtonnButton)
        setNeedsUpdateConstraints()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(geoButton)
        addSubview(filterButtonnButton)
        setNeedsUpdateConstraints()
    }
    
    func fill(_ geoButtonTitle: String) {
        geoButton.setTitle(geoButtonTitle, for: .normal)
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        geoButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        geoButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        filterButtonnButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        filterButtonnButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        filterButtonnButton.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        filterButtonnButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
    }
}
