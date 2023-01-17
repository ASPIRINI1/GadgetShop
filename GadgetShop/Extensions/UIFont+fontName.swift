//
//  UIFont+fontName.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 10.12.2022.
//

import UIKit

extension UIFont {
    enum FontName: String {
        case markPro = "Mark Pro"
        case markProBlack = "MARKPRO-BLACK"
        case markProMedium = "MARKPRO-MEDIUM"
        case markProBold = "MARKPRO-BOLD"
        case markProHeavy = "MARKPRO-HEAVY"
    }
    
    convenience init?(name: FontName, size: CGFloat) {
        self.init(name: name.rawValue, size: size)
    }
}
