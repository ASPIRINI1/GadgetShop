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
        tabBar.layer.cornerRadius = 20
        tabBar.backgroundColor = UIColor.CustomColor.pink.uiColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
