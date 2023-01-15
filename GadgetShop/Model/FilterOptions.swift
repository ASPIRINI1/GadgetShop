//
//  FilterOptions.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 17.12.2022.
//

import Foundation

class FilterOptions {
    var brand: String?
    var price: (from: Int?, to: Int?)?
    var size : (from: Double?, to: Double?)?
    var brands = ["Samsung", "Apple", "Huawei", "Motorolla"]
    var prices = [100, 200, 300 ,400 ,500, 600, 700, 800, 900, 1000]
    var sizes = [4.5, 4.7, 5.0, 5.5]
    
    init() { }
    
    init(brand: String?, price: (from: Int?, to: Int?), size: (from: Double?, to: Double?)) {
        self.brand = brand
        self.price = price
        self.size = size
    }
}
