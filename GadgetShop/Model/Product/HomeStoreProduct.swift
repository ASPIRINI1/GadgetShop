//
//  HomeStoreProduct.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 04.12.2022.
//

import Foundation

struct HomeStoreProduct: ProductProtocol {
    let id: Int
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
}
