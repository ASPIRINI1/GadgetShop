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
    func presentFilter(delegate: FilterViewModelDelegate?)
}

final class MainFlowCoordinator: MainFlowCoordinatorProtocol {
    
    var navigationController: UINavigationController
    var tabBarController: UITabBarController
    var parentCoordinator: CoordinatorProtocol?
    var childCoordinators = [CoordinatorProtocol]()
    let flowFactory = MainFlowFactory()
    
    init(tabBarController: UITabBarController, navigationController: UINavigationController) {
        self.tabBarController = tabBarController
        self.navigationController = navigationController
    }
    
    func start() {
        tabBarController.viewControllers = [flowFactory.makeProductList(self) ,flowFactory.makeCart(self)]
    }
    
    func pushToProductList() {
        navigationController.pushViewController(flowFactory.makeProductList(self), animated: false)
    }
    
    func presentCart() {
        navigationController.pushViewController(flowFactory.makeCart(self), animated: true)
    }
    
    func pushToDetail(productID: Int) {
        navigationController.pushViewController(flowFactory.makeDetail(self, productID: productID), animated: true)
    }
    
    func presentFilter(delegate: FilterViewModelDelegate?) {
        navigationController.present(flowFactory.makeFilter(self, delegate: delegate), animated: true)
    }
}
