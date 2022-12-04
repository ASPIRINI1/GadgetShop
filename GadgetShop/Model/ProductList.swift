//
//  ProductList.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 04.12.2022.
//

import Foundation

class ProductList: Decodable {
    var homeStore: [HomeStoreProduct]
    var bestSeller: [BestSellerProduct]
    
    private enum CodingKeys: String, CodingKey {
        case homeStore = "home_store"
        case bestSeller = "best_seller"
    }
}
