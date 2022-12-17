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
        var fontname: String
        switch name {
        case .markPro:
            fontname = FontName.markPro.rawValue
        case .markProBlack:
            fontname = FontName.markProBlack.rawValue
        case .markProMedium:
            fontname = FontName.markProMedium.rawValue
        case .markProBold:
            fontname = FontName.markProBold.rawValue
        case .markProHeavy:
            fontname = FontName.markProHeavy.rawValue
        }
        self.init(name: fontname, size: size)
    }
}
