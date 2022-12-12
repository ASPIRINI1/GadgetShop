//
//  SearchCollectionViewCell.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 12.12.2022.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {
    
    private lazy var searchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()
    let someButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubview(searchBar)
        addSubview(someButton)
        setNeedsUpdateConstraints()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(searchBar)
        addSubview(someButton)
        setNeedsUpdateConstraints()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        searchBar.topAnchor.constraint(equalTo: topAnchor).isActive = true
        searchBar.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        searchBar.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        someButton.topAnchor.constraint(equalTo: topAnchor).isActive = true
        someButton.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        someButton.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        someButton.leftAnchor.constraint(equalTo: searchBar.rightAnchor).isActive = true
    }
}
