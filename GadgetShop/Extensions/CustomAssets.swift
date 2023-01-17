//
//  CustomAssets.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 17.01.2023.
//

import UIKit

protocol CustomImageEnumProtocol {
    var stringName: String { get }
}

extension CustomImageEnumProtocol {
    var imageData: Data? {
        return uiImage?.pngData()
    }
    
    var uiImage: UIImage? {
        return UIImage(named: stringName)
    }
}

enum CustomCategoriesAssets: CustomImageEnumProtocol {
    case cpu, camera, ram, rom
    
    var stringName: String {
        switch self {
        case .cpu:
            return "cpu"
        case .camera:
            return "camera"
        case .ram:
            return "ram"
        case .rom:
            return "memory-card"
        }
    }
}

enum CustomInterfaceAssets: CustomImageEnumProtocol {
    case mapPoint, filler, newMark, book, heart, monitor, phone, accessories, filter
    
    var stringName: String {
        switch self {
        case .mapPoint:
            return "mapPoint"
        case .filler:
            return "filler"
        case .newMark:
            return "newMark"
        case .book:
            return "book"
        case .heart:
            return "heart"
        case .monitor:
            return "monitor"
        case .phone:
            return "phone"
        case .accessories:
            return "accessories"
        case .filter:
            return "filter"
        }
    }
}
