//
//  MainFlowCoordinator.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 07.12.2022.
//

import UIKit

protocol MainFlowCoordinatorProtocol: CoordinatorProtocol {
    func pushToProductList()
    func presentCart()
    func pushToDetail(productID: Int)
}

class MainFlowCoordinator: MainFlowCoordinatorProtocol {
    
    var navigationController: UINavigationController
    var parentCoordinator: CoordinatorProtocol?
    var childCoordinators = [CoordinatorProtocol]()
    let flowFactory = MainFlowFactory()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        pushToProductList()
    }
    
    func pushToProductList() {
        navigationController.pushViewController(flowFactory.makeProductList(self), animated: false)
    }
    
    func presentCart() {
        navigationController.pushViewController(flowFactory.makeCart(self), animated: false)
    }
    
    func pushToDetail(productID: Int) {
        navigationController.pushViewController(flowFactory.makeDetail(self), animated: false)
    }
}
