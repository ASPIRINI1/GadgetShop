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
    
    let networkService = NetwokrService.shared
    
    func makeCart(_ coordinator: CartFlowCoordinatorProtocol) -> UIViewController {
        let viewModel = CartViewModel(networkService: networkService, coordinator: coordinator)
        let vc = CartViewController(viewModel: viewModel)
        vc.tabBarItem.image = UIImage(systemName: "star")
        vc.tabBarItem.title = "Cart"
        return vc
    }
    
    func makePaymentScreen(_ coordinator: CartFlowCoordinatorProtocol) -> UIViewController {
        return UIViewController()
    }
}
