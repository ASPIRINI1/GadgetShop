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
    
    convenience init?(name: FontName, size: Int) {
        var fontname: String
        switch name {
        case .markPro:
            fontname = FontName.markPro.rawValue
        case .markProBlack:
            fontname = FontName.markPro.rawValue
        case .markProMedium:
            fontname = FontName.markPro.rawValue
        case .markProBold:
            fontname = FontName.markPro.rawValue
        case .markProHeavy:
            fontname = FontName.markPro.rawValue
        }
        self.init(name: fontname, size: 3)
    }
}
