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
    func pushToDetail()
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
        navigationController.viewControllers = [flowFactory.makeProductList(self)]
    }
    
    func presentCart() {
        navigationController.viewControllers = [flowFactory.makeCart( self)]
    }
    
    func pushToDetail() {
        navigationController.viewControllers = [flowFactory.makeDetail(self)]
    }
}
