//
//  HotSalesCollectionViewCell.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 05.12.2022.
//

import UIKit

protocol HotSalesCollectionViewCellDelegate: AnyObject {
    func hotSalesCollectionViewCell(_ cell: HotSalesCollectionViewCell, didTapBuyButtonForProductWith id: Int)
}

class HotSalesCollectionViewCell: UICollectionViewCell {
    
    private lazy var imageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .right
        return view
    }()
    private lazy var newMark = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "newMark")
        return view
    }()
    private lazy var brandLabel = {
        let label = UILabel()
//        label.font = UIFont(name: .markPro, size: 20)
        return label
    }()
    private lazy var descriptionLabel = {
        let label = UILabel()
//        label.font = UIFont(name: .markPro, size: 10)
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    private lazy var buyButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .red
        button.layer.cornerRadius = 10
        button.setTitle("Buy now!", for: .normal)
        button.addTarget(self, action: #selector(buyButtonTapAction), for: .touchUpInside)
        return button
    }()
    private lazy var labelStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.addArrangedSubview(brandLabel)
        view.addArrangedSubview(descriptionLabel)
        return view
    }()
    private var productID: Int = 0
    weak var delegate: HotSalesCollectionViewCellDelegate?
    
    func fill(product: HomeStoreProduct) {
        productID = product.id
        brandLabel.text = product.title
        descriptionLabel.text = product.subtitle
        setup()
    }
    
    private func setup() {
        layer.cornerRadius = 10
        addSubview(imageView)
        addSubview(labelStackView)
        addSubview(buyButton)
        addSubview(newMark)
        backgroundColor = .lightGray
        setNeedsUpdateConstraints()
    }
    
    @objc private func buyButtonTapAction(_ sender: UIButton) {
        delegate?.hotSalesCollectionViewCell(self, didTapBuyButtonForProductWith: productID)
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        newMark.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        newMark.leftAnchor.constraint(equalTo: buyButton.leftAnchor).isActive = true
        newMark.widthAnchor.constraint(equalToConstant: 25).isActive = true
        newMark.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        labelStackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        labelStackView.leftAnchor.constraint(equalTo: buyButton.leftAnchor).isActive = true
        labelStackView.widthAnchor.constraint(equalTo: buyButton.widthAnchor).isActive = true
            
        buyButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        buyButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        buyButton.heightAnchor.constraint(equalToConstant: 31).isActive = true
        buyButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        imageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
    }
}
