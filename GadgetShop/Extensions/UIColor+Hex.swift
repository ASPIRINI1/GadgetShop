//
//  UIColor+Hex.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 08.12.2022.
//

import UIKit

extension UIColor {
    convenience init?(_ hex:String) {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if cString.hasPrefix("#") {
            cString.remove(at: cString.startIndex)
        }
        guard cString.count == 6 else { return nil }
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        self.init(displayP3Red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                  alpha: 1.0)
    }
    
    enum CustomColor: String {
        case orange = "FF6E4E"
        case pink = "010035"
        
        var uiColor: UIColor? {
            switch self {
            case .orange:
                return .init(CustomColor.orange.rawValue)
            case .pink:
                return .init(CustomColor.pink.rawValue)
            }
        }
    }
}
