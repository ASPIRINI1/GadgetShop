//
//  RoundedTapBarController.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 12.01.2023.
//

import UIKit

class RoundedTapBarController: UITabBarController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        tabBar.backgroundColor = UIColor.CustomColor.pink.uiColor
        tabBar.barTintColor = UIColor(.pink)
        tabBar.tintColor = UIColor(.orange)
        tabBar.layer.cornerRadius = 20
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        tabBar.layer.masksToBounds = true
        tabBar.unselectedItemTintColor = .white
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
