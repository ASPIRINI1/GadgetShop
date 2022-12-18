//
//  DetailProduct.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 04.12.2022.
//

import Foundation

class DetailProduct: ProductProtocol {
    let id: Int
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
    
    private enum Errors: Error {
        case idParsingError
    }
    
    enum CodingKeys: CodingKey {
        case id, title, price, CPU, camera, capacity, color, images, rating, sd, ssd, isFavorites
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self) 
        guard let id = Int(try container.decode(String.self, forKey: .id)) else { throw Errors.idParsingError }
        self.id = id
        self.title = try container.decode(String.self, forKey: .title)
        self.price = try container.decode(Int.self, forKey: .price)
        self.CPU = try container.decode(String.self, forKey: .CPU)
        self.camera = try container.decode(String.self, forKey: .camera)
        self.capacity = try container.decode([String].self, forKey: .capacity)
        self.color = try container.decode([String].self, forKey: .color)
        self.images = try container.decode([String].self, forKey: .images)
        self.rating = try container.decode(Float.self, forKey: .rating)
        self.sd = try container.decode(String.self, forKey: .sd)
        self.ssd = try container.decode(String.self, forKey: .ssd)
        self.isFavorites = try container.decode(Bool.self, forKey: .isFavorites)
    }
}
