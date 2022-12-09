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
        label.textAlignment = .center
        return label
    }()
    private lazy var imageView = {
        let view = UIImageView()
        view.layer.cornerRadius = layer.bounds.width / 2
        view.contentMode = .scaleAspectFit
        view.backgroundColor = .white
        return view
    }()
    private lazy var stackView = {
        let view = UIStackView(frame: self.frame)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.addArrangedSubview(imageView)
        view.addArrangedSubview(titleLabel)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(stackView)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubview(stackView)
    }
    
    func fill(image: UIImage, title: String) {
        imageView.image = image
        titleLabel.text = title
    }
    
    func set(selected: Bool) {
        if selected {
            backgroundColor = .white
        } else {
            backgroundColor = .white
        }
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
}
