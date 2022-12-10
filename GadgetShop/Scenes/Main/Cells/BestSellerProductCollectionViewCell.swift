//
//  BestSellerProductCollectionViewCell.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 05.12.2022.
//

import UIKit

class BestSellerProductCollectionViewCell: UICollectionViewCell {
    
    private var imageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }
    private var brandLabel = {
        let label = UILabel()
        label.font = UIFont(name: .markPro, size: 17)
        return label
    }
    private var addToFavoritesButton = UIButton()
    private lazy var priceWithoutDiscountLabel = UILabel()
    private var discountPriceLabel = UILabel()
    
    func fill(product: BestSellerProduct) {
        
    }
    
    override func updateConstraints() {
        
    }
}
