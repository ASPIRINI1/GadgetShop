//
//  UITableViewCell+Identefier.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 15.12.2022.
//

import UIKit

extension UITableViewCell {
    static var identefier: String {
        get {
            return String.init(describing: self)
        }
    }
}
