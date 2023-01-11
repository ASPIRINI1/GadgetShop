//
//  SpecsCollectionViewCell.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 22.12.2022.
//

import UIKit

class SpecsCollectionViewCell: UICollectionViewCell {
    
    private lazy var imageView = {
        let view = UIImageView()
        view.tintColor = .systemGray4
        view.contentMode = .scaleAspectFit
        return view
    }()
    private lazy var titleLabel = {
        let label = UILabel()
        label.font = UIFont(name: .markPro, size: 12)
        label.textColor = .systemGray4
        label.textAlignment = .center
        return label
    }()
    private lazy var stackView = {
        let view = UIStackView(arrangedSubviews: [imageView, titleLabel])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.distribution = .fillEqually
        return view
    }()
    
    //  MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(stackView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //  MARK: - Public funcs
    
    func fill(image: UIImage?, title: String) {
        imageView.image = image
        titleLabel.text = title
    }
    
    //  MARK: - Layout
    
    override func updateConstraints() {
        super.updateConstraints()
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
}
