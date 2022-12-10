//
//  BestSellerProductCollectionViewCell.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 05.12.2022.
//

import UIKit

protocol BestSellerProductCollectionViewCellDelegate: AnyObject {
    func bestSellerProductCollectionViewCell(_ cell: BestSellerProductCollectionViewCell, didTapAddToFavorietsForProductWith id: Int)
}

class BestSellerProductCollectionViewCell: UICollectionViewCell {
    
    private var imageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .red
        return imageView
    }()
    private var titleLabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
//        label.font = UIFont(name: .markPro, size: 17)
        return label
    }()
    private lazy var priceWithoutDiscountLabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
//        label.font = UIFont(name: .markPro, size: 17)
        return label
    }()
    private var discountPriceLabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
//        label.font = UIFont(name: .markPro, size: 17)
        return label
    }()
    private var addToFavoritesButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = button.frame.width / 2
        button.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        button.setImage(UIImage(systemName: "heart.fill"), for: .selected)
        button.setTitleColor(.CustomColor.orange.uiColor, for: .selected)
        return button
    }()
    
    var productID: Int = 0
    weak var delegate: BestSellerProductCollectionViewCellDelegate?
    
    func fill(product: BestSellerProduct) {
        productID = product.id
        titleLabel.text = product.title
        priceWithoutDiscountLabel.text = String(product.priceWithoutDiscount)
        discountPriceLabel.text = String(product.discountPrice)
        setup()
    }
    
    private func setup() {
        backgroundColor = .lightGray
        layer.cornerRadius = 10
        addSubview(imageView)
        addSubview(addToFavoritesButton)
        addSubview(priceWithoutDiscountLabel)
        addSubview(discountPriceLabel)
        addSubview(titleLabel)
        setNeedsUpdateConstraints()
    }
    
    @objc private func addToFavorietsButtonAction(_ sender: UIButton) {
        delegate?.bestSellerProductCollectionViewCell(self, didTapAddToFavorietsForProductWith: productID)
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: frame.height*0.75).isActive = true
        
        addToFavoritesButton.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        addToFavoritesButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        addToFavoritesButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        addToFavoritesButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 5).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: 5).isActive = true
        
        priceWithoutDiscountLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 5).isActive = true
        priceWithoutDiscountLabel.bottomAnchor.constraint(equalTo: titleLabel.topAnchor).isActive = true

        discountPriceLabel.bottomAnchor.constraint(equalTo: titleLabel.topAnchor).isActive = true
        discountPriceLabel.leftAnchor.constraint(equalTo: priceWithoutDiscountLabel.rightAnchor).isActive = true
        discountPriceLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
}
