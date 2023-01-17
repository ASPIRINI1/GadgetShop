//
//  MainFlowCoordinator.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 07.12.2022.
//

import UIKit

protocol MainFlowCoordinatorProtocol: CoordinatorProtocol {
    func pushToProductList(_ animated: Bool)
    func pushToDetail(productID: Int, _ animated: Bool)
    func presentFilter(delegate: FilterViewModelDelegate?, _ animated: Bool)
}

final class MainFlowCoordinator: MainFlowCoordinatorProtocol {
    
    var navigationController: UINavigationController
    var tabBarController: UITabBarController
    var parentCoordinator: CoordinatorProtocol?
    var childCoordinators = [CoordinatorProtocol]()
    let flowFactory = MainFlowFactory()
    
    init(tabBarController: UITabBarController) {
        self.tabBarController = tabBarController
        self.navigationController = UINavigationController()
        self.navigationController.isNavigationBarHidden = true
    }
    
    func start() {
        navigationController.setViewControllers([flowFactory.makeProductList(self)], animated: false)
    }
    
    func pushToProductList(_ animated: Bool) {
        navigationController.pushViewController(flowFactory.makeProductList(self), animated: animated)
    }
    
    func pushToDetail(productID: Int, _ animated: Bool) {
        navigationController.pushViewController(flowFactory.makeDetail(self, productID: productID), animated: animated)
    }
    
    func presentFilter(delegate: FilterViewModelDelegate?, _ animated: Bool) {
        navigationController.present(flowFactory.makeFilter(self, delegate: delegate), animated: animated)
    }
}
