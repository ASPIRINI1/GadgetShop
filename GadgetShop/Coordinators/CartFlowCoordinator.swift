//
//  CartFlowCoordinator.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 15.01.2023.
//

import UIKit

protocol CartFlowCoordinatorProtocol: CoordinatorProtocol {
    func pushToCart(_ animated: Bool)
    func pushToPaymentScreen(_ animated: Bool)
}

final class CartFlowCoordinator: CartFlowCoordinatorProtocol {
    
    var navigationController: UINavigationController
    var tabBarController: UITabBarController
    var parentCoordinator: CoordinatorProtocol?
    var childCoordinators = [CoordinatorProtocol]()
    let flowFactory = CartFlowFactory()
    
    init(tabBarController: UITabBarController) {
        self.tabBarController = tabBarController
        self.navigationController = UINavigationController()
        self.navigationController.isNavigationBarHidden = true
    }
    
    func start() {
        navigationController.setViewControllers([flowFactory.makeCart(self)], animated: false)
    }
    
    func pushToCart(_ animated: Bool) {
        navigationController.pushViewController(flowFactory.makeCart(self), animated: animated)
    }
    
    func pushToPaymentScreen(_ animated: Bool) {
        navigationController.pushViewController(flowFactory.makePaymentScreen(self), animated: animated)
    }
}
