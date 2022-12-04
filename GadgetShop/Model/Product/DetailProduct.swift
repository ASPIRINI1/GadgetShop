//
//  DetailProduct.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 04.12.2022.
//

import Foundation

struct DetailProduct: ProductProtocol {
    let id: String
    var title: String
    var price: Int
    var CPU: String
    var camera: String
    var capacity: [String]
    var color: [String]
    var images: [String]
    var rating: Float
    var sd: String
    var ssd: String
    var isFavorites: Bool
}
