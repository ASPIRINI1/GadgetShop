//
//  MainFlowCoordinator.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 07.12.2022.
//

import UIKit

protocol MainFlowCoordinatorProtocol: CoordinatorProtocol {
    func pushToProductList()
    func pushToDetail(productID: Int)
    func presentFilter(delegate: FilterViewModelDelegate?)
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
    
    func pushToProductList() {
        navigationController.pushViewController(flowFactory.makeProductList(self), animated: false)
    }
    
    func pushToDetail(productID: Int) {
        navigationController.pushViewController(flowFactory.makeDetail(self, productID: productID), animated: true)
    }
    
    func presentFilter(delegate: FilterViewModelDelegate?) {
        navigationController.present(flowFactory.makeFilter(self, delegate: delegate), animated: true)
    }
}
