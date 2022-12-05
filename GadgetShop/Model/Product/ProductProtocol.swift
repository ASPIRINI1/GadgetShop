//
//  ProductProtocol.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 04.12.2022.
//

import Foundation

protocol ProductProtocol: Decodable {
    var id: Int { get }
    var title: String { get set }
}
