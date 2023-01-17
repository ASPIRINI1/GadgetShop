//
//  MainCategoryCollectionViewCell.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 05.12.2022.
//

import UIKit

class MainCategoryCollectionViewCell: UICollectionViewCell {
    
    private lazy var titleLabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: .markProBold, size: 13)
        label.textAlignment = .center
        return label
    }()
    private lazy var subView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.shadowOpacity = 0.1
        view.layer.shadowRadius = 10
        view.layer.shadowOffset = CGSize.zero
        return view
    }()
    private lazy var imageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.tintColor = .gray
        return view
    }()
    
    // MARK: - Init
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(subView)
        subView.addSubview(imageView)
        addSubview(titleLabel)
    }
    
    // MARK: - Cell setup
    
    func fill(image: UIImage?, title: String) {
        imageView.image = image
        titleLabel.text = title
        setNeedsUpdateConstraints()
    }
    
    func set(selected: Bool) {
        UIView.animate(withDuration: 0.3) {
            if selected {
                self.subView.backgroundColor = UIColor.CustomColor.orange.uiColor
                self.imageView.tintColor = .white
                self.isSelected = true
            } else {
                self.subView.backgroundColor = .white
                self.imageView.tintColor = .gray
                self.isSelected = false
            }
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
        
        titleLabel.topAnchor.constraint(equalTo: subView.bottomAnchor, constant: 5).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
}
