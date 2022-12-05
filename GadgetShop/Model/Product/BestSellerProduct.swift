//
//  BestSellerProduct.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 04.12.2022.
//

import Foundation

struct BestSellerProduct: ProductProtocol {
    let id: Int
    var title: String
    var picture: String
    var priceWithoutDiscount: Int
    var discountPrice: Int
    var isFavorites: Bool
    
    private enum CodingKeys: String, CodingKey {
        case id, title, picture
        case priceWithoutDiscount = "price_without_discount"
        case discountPrice = "discount_price"
        case isFavorites = "is_favorites"
    }
}
