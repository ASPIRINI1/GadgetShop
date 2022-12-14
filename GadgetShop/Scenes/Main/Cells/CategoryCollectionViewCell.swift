//
//  CategoryCollectionViewCell.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 05.12.2022.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    private lazy var titleLabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
//        label.font = UIFont(name: .markPro, size: 230)
        label.textAlignment = .center
        return label
    }()
    private lazy var subView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    private lazy var imageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.tintColor = .gray
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(subView)
        subView.addSubview(imageView)
        addSubview(titleLabel)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Cell setup
    
    func fill(image: UIImage?, title: String) {
        imageView.image = image
        titleLabel.text = title
        setNeedsUpdateConstraints()
    }
    
    func set(selected: Bool) {
        if selected {
            subView.backgroundColor = UIColor.CustomColor.orange.uiColor
            imageView.tintColor = .white
            isSelected = true
        } else {
            subView.backgroundColor = .white
            imageView.tintColor = .gray
            isSelected = false
        }
    }
    
    // MARK: - Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        subView.layer.cornerRadius = subView.bounds.height / 2
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        subView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        subView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        subView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        imageView.heightAnchor.constraint(equalTo: subView.heightAnchor, multiplier: 0.5).isActive = true
        imageView.widthAnchor.constraint(equalTo: subView.widthAnchor, multiplier: 0.5).isActive = true
        imageView.centerXAnchor.constraint(equalTo: subView.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: subView.centerYAnchor).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: subView.bottomAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
}
