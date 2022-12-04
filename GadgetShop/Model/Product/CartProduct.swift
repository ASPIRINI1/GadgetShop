//
//  CartProduct.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 04.12.2022.
//

import Foundation

struct CartProduct: ProductProtocol {
    let id: String
    var title: String
    var price: Int
    var images: String
    
    enum CodingKeys: CodingKey {
        case id
        case title
        case price
        case images
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = String(try container.decode(Int.self, forKey: .id))
        self.title = try container.decode(String.self, forKey: .title)
        self.price = try container.decode(Int.self, forKey: .price)
        self.images = try container.decode(String.self, forKey: .images)
    }
}
