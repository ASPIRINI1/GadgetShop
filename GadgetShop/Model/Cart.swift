//
//  Cart.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 04.12.2022.
//

import Foundation

class Cart: Decodable {
    let id: String
    var basket: [CartProduct]
    var delivery: String
    var total: Int
    
    init(id: String, basket: [CartProduct], delivery: String, total: Int) {
        self.id = id
        self.basket = basket
        self.delivery = delivery
        self.total = total
    }
}
