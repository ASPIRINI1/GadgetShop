//
//  UIImage+CustomImages.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 14.12.2022.
//

import UIKit

extension UIImage {
    enum CustomAssets {
        case mapPoint, filler, newMark, orangeCircle, book, heart, monitor, phone, accessories, filter
        
        var stringName: String {
            switch self {
            case .mapPoint:
                return "mapPoint"
            case .filler:
                return "filler"
            case .newMark:
                return "newMark"
            case .orangeCircle:
                return "orangeCircle"
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
    
    convenience init?(_ customImage: CustomAssets) {
        self.init(named: customImage.stringName)
    }
}
