//
//  HeaderCollectionViewCell.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 12.12.2022.
//

import UIKit

protocol HeaderCollectionViewCellDelegate: AnyObject {
    func headerCollectionViewCelldidSelectGeoButton(_ cell: HeaderCollectionViewCell)
    func headerCollectionViewCelldidSelectFilterButton(_ cell: HeaderCollectionViewCell)
}

class HeaderCollectionViewCell: UICollectionViewCell {
    
    private lazy var geoButton = {
        var config = UIButton.Configuration.plain()
        config.imagePadding = 10
        config.imagePlacement = .trailing
        let button = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        button.setImage(UIImage(systemName: "chevron.up"), for: .selected)
        button.setTitleColor(.black, for: .normal)
        button.tintColor = .lightGray
        button.addAction(UIAction(handler: { _ in
            self.delegate?.headerCollectionViewCelldidSelectGeoButton(self)
        }), for: .touchUpInside)
        return button
    }()
    private lazy var filterButtonnButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage.CustomAssets.filler.image, for: .normal)
        button.addAction(UIAction(handler: { _ in
            self.delegate?.headerCollectionViewCelldidSelectFilterButton(self)
        }), for: .touchUpInside)
        return button
    }()
    private lazy var mapLlocatorImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage.CustomAssets.mapPoint.image
        imageView.tintColor = UIColor.CustomColor.orange.uiColor
        return imageView
    }()
    weak var delegate: HeaderCollectionViewCellDelegate?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(mapLlocatorImageView)
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
        geoButton.topAnchor.constraint(equalTo: topAnchor).isActive = true
        geoButton.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        geoButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 100).isActive = true
        geoButton.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        
        mapLlocatorImageView.rightAnchor.constraint(equalTo: geoButton.leftAnchor, constant: -10).isActive = true
        mapLlocatorImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        mapLlocatorImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        mapLlocatorImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        filterButtonnButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        filterButtonnButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        filterButtonnButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        filterButtonnButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
}
