//
//  UIImage+CustomImages.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 14.12.2022.
//

import UIKit

extension UIImage {
    enum CustomAssets {
        case mapPoint, filler, newMark, orangeCircle
        
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
            }
        }
        
        var image: UIImage? {
            switch self {
            case .mapPoint:
                return UIImage(named: CustomAssets.mapPoint.stringName)
            case .filler:
                return UIImage(named: CustomAssets.filler.stringName)
            case .newMark:
                return UIImage(named: CustomAssets.newMark.stringName)
            case .orangeCircle:
                return UIImage(named: CustomAssets.orangeCircle.stringName)
            }
        }
    }
}
