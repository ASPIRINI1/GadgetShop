//
//  MainHeaderCollectionViewCell.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 12.12.2022.
//

import UIKit

protocol MainHeaderCollectionViewCellDelegate: AnyObject {
    func headerCollectionViewCelldidSelectGeoButton(_ cell: MainHeaderCollectionViewCell)
    func headerCollectionViewCelldidSelectFllerButton(_ cell: MainHeaderCollectionViewCell)
}

class MainHeaderCollectionViewCell: UICollectionViewCell {
    
    private lazy var geoButton = {
        var config = UIButton.Configuration.plain()
        config.imagePadding = 10
        config.imagePlacement = .trailing
        let button = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.imageView?.tintColor = .green
        button.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        button.setImage(UIImage(systemName: "chevron.up"), for: .selected)
        button.setTitleColor(.black, for: .normal)
        button.tintColor = .systemGray2
        button.addAction(geoButtonAction, for: .touchUpInside)
        return button
    }()
    private lazy var fllerButtonnButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .black
        button.setImage(UIImage(.filler), for: .normal)
        button.addAction(fillterButtonAction, for: .touchUpInside)
        return button
    }()
    private lazy var mapLlocatorImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(.mapPoint)
        imageView.tintColor = UIColor.CustomColor.orange.uiColor
        return imageView
    }()
    weak var delegate: MainHeaderCollectionViewCellDelegate?
    
    // MARK: - Cell setup
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(mapLlocatorImageView)
        addSubview(geoButton)
        addSubview(fllerButtonnButton)
        setNeedsUpdateConstraints()
    }
    
    func fill(_ geoButtonTitle: String) {
        guard let font = UIFont(name: .markProBold, size: 17) else { return }
        let title = NSAttributedString(string: geoButtonTitle, attributes: [NSAttributedString.Key.font : font,
                                                                            NSAttributedString.Key.foregroundColor : UIColor.black])
        geoButton.setAttributedTitle(title, for: .normal)
    }
    
    // MARK: - Actions
    
    private lazy var fillterButtonAction = UIAction { _ in
        self.delegate?.headerCollectionViewCelldidSelectFllerButton(self)
    }
    
    private lazy var geoButtonAction = UIAction { _ in
        self.delegate?.headerCollectionViewCelldidSelectGeoButton(self)
    }
    
    //  MARK: - Layout
    
    override func updateConstraints() {
        super.updateConstraints()
        
        geoButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        geoButton.topAnchor.constraint(equalTo: topAnchor).isActive = true
        geoButton.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        geoButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 100).isActive = true
        geoButton.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        
        mapLlocatorImageView.rightAnchor.constraint(equalTo: geoButton.leftAnchor, constant: -10).isActive = true
        mapLlocatorImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        mapLlocatorImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        mapLlocatorImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        fllerButtonnButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -25).isActive = true
        fllerButtonnButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        fllerButtonnButton.widthAnchor.constraint(equalToConstant: 15).isActive = true
        fllerButtonnButton.heightAnchor.constraint(equalToConstant: 15).isActive = true
    }
}
