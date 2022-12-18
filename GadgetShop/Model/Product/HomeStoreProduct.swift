//
//  HomeStoreProduct.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 04.12.2022.
//

import Foundation

class HomeStoreProduct: ProductProtocol {
    let id: Int
    var title: String
    var subtitle: String
    var picture: String
    var isNew: Bool?
    var isBuy: Bool
    var imageData: Data?
    
    private enum CodingKeys: String, CodingKey {
        case id, title, subtitle, picture
        case isNew = "is_new"
        case isBuy = "is_buy"
    }
    
    init(id: Int, title: String, subtitle: String, picture: String, isNew: Bool? = nil, isBuy: Bool, imageData: Data? = nil) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.picture = picture
        self.isNew = isNew
        self.isBuy = isBuy
        self.imageData = imageData
    }
}
