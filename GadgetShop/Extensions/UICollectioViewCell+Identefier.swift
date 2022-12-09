//
//  UICollectioViewCell+Identefier.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 09.12.2022.
//

import UIKit

extension UICollectionViewCell {
    static var identefier: String {
        get {
            return String.init(describing: self)
        }
    }
}
