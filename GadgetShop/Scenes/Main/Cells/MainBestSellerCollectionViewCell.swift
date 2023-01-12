//
//  MainBestSellerCollectionViewCell.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 05.12.2022.
//

import UIKit

protocol MainBestSellerCollectionViewCellDelegate: AnyObject {
    func bestSellerProductCollectionViewCell(_ cell: MainBestSellerCollectionViewCell, didTapAddToFavorietsForProductWith id: Int)
}

class MainBestSellerCollectionViewCell: UICollectionViewCell {
    
    private lazy var imageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.backgroundColor = .white
        imageView.layer.cornerRadius = layer.cornerRadius
        return imageView
    }()
    private lazy var titleLabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: .markPro, size: 12)
        label.tintColor = .systemGray6
        return label
    }()
    private lazy var priceWithoutDiscountLabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: .markProBold, size: 17)
        return label
    }()
    private lazy var discountPriceLabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: .markProBold, size: 15)
        return label
    }()
    private lazy var addToFavoritesButton = {
        let button = UIButton()
        button.setPreferredSymbolConfiguration(.init(scale: .small), forImageIn: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = button.frame.width / 2
        button.layer.shadowOpacity = 0.1
        button.layer.shadowOffset = CGSize.zero
        button.layer.shadowRadius = 10
        let image = UIImage(systemName: "circle.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        button.setBackgroundImage(image, for: .normal)
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.setImage(UIImage(systemName: "heart.fill"), for: .selected)
        button.tintColor = UIColor.CustomColor.orange.uiColor
        button.addTarget(self, action: #selector(addToFavorietsAction), for: .touchUpInside)
        return button
    }()
    var productID: Int = 0
    weak var delegate: MainBestSellerCollectionViewCellDelegate?
    
    // MARK: - Cell setup
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.cornerRadius = 10
        clipsToBounds = true
        addSubview(imageView)
        addSubview(addToFavoritesButton)
        addSubview(priceWithoutDiscountLabel)
        addSubview(discountPriceLabel)
        addSubview(titleLabel)
        setNeedsUpdateConstraints()
    }
    
    func fill(product: BestSellerProduct) {
        productID = product.id
        titleLabel.text = product.title
        priceWithoutDiscountLabel.text = "$\(product.priceWithoutDiscount)"
        addToFavoritesButton.isSelected = product.isFavorites
        guard let font = UIFont(name: .markProBold, size: 17) else { return }
        let title = NSAttributedString(string: "$\(product.discountPrice)",
                                       attributes: [NSAttributedString.Key.font : font,
                                                    NSAttributedString.Key.strikethroughStyle : NSUnderlineStyle.single.rawValue,
                                                    NSAttributedString.Key.foregroundColor : UIColor.systemGray3])
        discountPriceLabel.attributedText = title
        guard let imageData = product.imageData else { return }
        imageView.image = UIImage(data: imageData)
    }
    
    // MARK: - Actions
    
    @objc private func addToFavorietsAction(_ sender: UIButton) {
        self.addToFavoritesButton.isSelected = !addToFavoritesButton.isSelected
        delegate?.bestSellerProductCollectionViewCell(self, didTapAddToFavorietsForProductWith: productID)
    }
    
    //  MARK: - Layout
    
    override func updateConstraints() {
        super.updateConstraints()
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.75).isActive = true
        
        addToFavoritesButton.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        addToFavoritesButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        addToFavoritesButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        addToFavoritesButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        
        priceWithoutDiscountLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 5).isActive = true
        priceWithoutDiscountLabel.bottomAnchor.constraint(equalTo: titleLabel.topAnchor).isActive = true

        discountPriceLabel.bottomAnchor.constraint(equalTo: titleLabel.topAnchor).isActive = true
        discountPriceLabel.leftAnchor.constraint(equalTo: priceWithoutDiscountLabel.rightAnchor, constant: 10).isActive = true
    }
}
