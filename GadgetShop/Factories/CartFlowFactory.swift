//
//  CartFlowFactory.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 15.01.2023.
//

import UIKit

protocol CartFlowFactoryProtocol {
    func makeCart(_ coordinator: CartFlowCoordinatorProtocol) -> UIViewController
    func makePaymentScreen(_ coordinator: CartFlowCoordinatorProtocol)  -> UIViewController
}

final class CartFlowFactory: CartFlowFactoryProtocol {
    
    func makeCart(_ coordinator: CartFlowCoordinatorProtocol) -> UIViewController {
        let vc = UIViewController()
        vc.tabBarItem.image = UIImage(systemName: "star")
        vc.tabBarItem.title = "Cart"
        return vc
    }
    
    func makePaymentScreen(_ coordinator: CartFlowCoordinatorProtocol) -> UIViewController {
        return UIViewController()
    }
}
