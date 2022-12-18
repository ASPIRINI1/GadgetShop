//
//  BestSellerProduct.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 04.12.2022.
//

import Foundation

class BestSellerProduct: ProductProtocol {
    let id: Int
    var title: String
    var picture: String
    var priceWithoutDiscount: Int
    var discountPrice: Int
    var isFavorites: Bool
    var imageData: Data?
    
    private enum CodingKeys: String, CodingKey {
        case id, title, picture
        case priceWithoutDiscount = "price_without_discount"
        case discountPrice = "discount_price"
        case isFavorites = "is_favorites"
    }
    
    init(id: Int, title: String, picture: String, priceWithoutDiscount: Int, discountPrice: Int, isFavorites: Bool, imageData: Data? = nil) {
        self.id = id
        self.title = title
        self.picture = picture
        self.priceWithoutDiscount = priceWithoutDiscount
        self.discountPrice = discountPrice
        self.isFavorites = isFavorites
        self.imageData = imageData
    }
}
