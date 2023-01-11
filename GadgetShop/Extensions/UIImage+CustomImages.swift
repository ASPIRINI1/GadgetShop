//
//  UIImage+CustomImages.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 14.12.2022.
//

import UIKit

extension UIImage {
    
    enum CustomInterfaceAssets {
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
    
    enum CustomCategoriesAssets {
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
    
    convenience init?(_ customImage: CustomInterfaceAssets) {
        self.init(named: customImage.stringName)
    }
    
    convenience init?(_ customImage: CustomCategoriesAssets) {
        self.init(named: customImage.stringName)
    }
}
