//
//  BestSellerProduct.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 04.12.2022.
//

import Foundation

struct BestSellerProduct: ProductProtocol {
    let id: String
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
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = String(try container.decode(Int.self, forKey: .id))
        self.title = try container.decode(String.self, forKey: .title)
        self.picture = try container.decode(String.self, forKey: .picture)
        self.priceWithoutDiscount = try container.decode(Int.self, forKey: .priceWithoutDiscount)
        self.discountPrice = try container.decode(Int.self, forKey: .discountPrice)
        self.isFavorites = try container.decode(Bool.self, forKey: .isFavorites)
    }
}
