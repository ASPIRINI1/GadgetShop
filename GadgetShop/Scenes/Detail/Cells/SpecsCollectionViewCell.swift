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
        return view
    }()
    private lazy var titleLabel = {
        let label = UILabel()
        return label
    }()
    private lazy var stackView = {
        let view = UIStackView(arrangedSubviews: [imageView, titleLabel])
        view.axis = .vertical
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(stackView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func fill(image: UIImage?, title: String) {
        imageView.image = image
        titleLabel.text = title
    }
    
    override func updateConstraints() {
        super.updateConstraints()
    }
}
