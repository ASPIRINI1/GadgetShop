//
//  MainSearchCollectionViewCell.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 12.12.2022.
//

import UIKit

protocol MainSearchCollectionViewCellDelegate: AnyObject {
    func searchCollectionViewCellDidTapFilterButton(_ cell: MainSearchCollectionViewCell)
}

class MainSearchCollectionViewCell: UICollectionViewCell {
    
    private lazy var searchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "Search"
        searchBar.searchTextField.font = UIFont(name: .markPro, size: 13)
        if let color = UIColor.CustomColor.orange.uiColor {
            var image = UIImage(systemName: "magnifyingglass")
            image = image?.withTintColor(color, renderingMode: .alwaysOriginal)
            searchBar.setImage(image, for: .search, state: .normal)
        }
        return searchBar
    }()
    private lazy var filterButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(.filter), for: .normal)
        button.tintColor = .white
        button.backgroundColor = UIColor.CustomColor.orange.uiColor
        button.contentEdgeInsets = .init(top: 10, left: 10, bottom: 10, right: 10)
        button.addAction(filterButtonAction, for: .touchUpInside)
        return button
    }()
    weak var delegate: MainSearchCollectionViewCellDelegate?
    
    // MARK: - Cell setup
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(searchBar)
        addSubview(filterButton)
        setNeedsUpdateConstraints()
    }
    
    // MARK: - Actions
    
    private lazy var filterButtonAction = UIAction { [weak self] _ in
        guard let self = self else { return }
        self.delegate?.searchCollectionViewCellDidTapFilterButton(self)
    }
    
    // MARK: - Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        filterButton.layer.cornerRadius = filterButton.bounds.height / 2
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        searchBar.topAnchor.constraint(equalTo: topAnchor).isActive = true
        searchBar.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        searchBar.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        filterButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        filterButton.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        filterButton.leftAnchor.constraint(equalTo: searchBar.rightAnchor).isActive = true
        filterButton.widthAnchor.constraint(equalTo: searchBar.searchTextField.heightAnchor).isActive = true
        filterButton.heightAnchor.constraint(equalTo: searchBar.searchTextField.heightAnchor).isActive = true
    }
}
