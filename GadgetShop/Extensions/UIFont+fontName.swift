//
//  UIFont+fontName.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 10.12.2022.
//

import UIKit

extension UIFont {
    enum FontName {
        case markPro, markProBlack, markProMedium, markProBold, markProHeavy
        
        var stringName: String {
            switch self {
            case .markPro:
                return "Mark Pro"
            case .markProBlack:
                return "MARKPRO-BLACK"
            case .markProMedium:
                return "MARKPRO-MEDIUM"
            case .markProBold:
                return "MARKPRO-BOLD"
            case .markProHeavy:
                return "MARKPRO-HEAVY"
            }
        }
    }
    
    convenience init?(name: FontName, size: Int) {
        var fontname: String
        switch name {
        case .markPro:
            fontname = FontName.markPro.stringName
        case .markProBlack:
            fontname = FontName.markPro.stringName
        case .markProMedium:
            fontname = FontName.markPro.stringName
        case .markProBold:
            fontname = FontName.markPro.stringName
        case .markProHeavy:
            fontname = FontName.markPro.stringName
        }
        self.init(name: fontname, size: 3)
    }
}
