//
//  HomeStoreProduct.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 04.12.2022.
//

import Foundation

struct HomeStoreProduct: ProductProtocol {
    let id: String
    var title: String
    var subtitle: String
    var picture: String
    var isNew: Bool?
    var isBuy: Bool
    
    private enum CodingKeys: String, CodingKey {
        case id, title, subtitle, picture
        case isNew = "is_new"
        case isBuy = "is_buy"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = String(try container.decode(Int.self, forKey: .id))
        self.title = try container.decode(String.self, forKey: .title)
        self.subtitle = try container.decode(String.self, forKey: .subtitle)
        self.picture = try container.decode(String.self, forKey: .picture)
        self.isNew = try container.decodeIfPresent(Bool.self, forKey: .isNew)
        self.isBuy = try container.decode(Bool.self, forKey: .isBuy)
    }
}
