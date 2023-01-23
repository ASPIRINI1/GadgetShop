//
//  CartProduct.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 04.12.2022.
//

import Foundation

class CartProduct: ProductProtocol {
    let id: Int
    var title: String
    var price: Int
    var images: String
    var imageData: Data?
}
