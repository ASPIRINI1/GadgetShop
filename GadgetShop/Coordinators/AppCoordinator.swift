//
//  AppCoordinator.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 04.12.2022.
//

import UIKit

final class AppCoordinator: CoordinatorProtocol {
    
    var tabBarController: UITabBarController
    var navigationController: UINavigationController
    var parentCoordinator: CoordinatorProtocol?
    var childCoordinators = [CoordinatorProtocol]()
    
    init(tabBarController: UITabBarController) {
        self.tabBarController = tabBarController
        self.navigationController = .init()
    }
    
    func start() {
        showMainFlow()
        showCartFlow()
        showFavorietsFlow()
        showProfileFlow()
    }
    
    func showMainFlow() {
        let coordinator = MainFlowCoordinator(tabBarController: tabBarController)
        coordinator.start()
        tabBarController.addChild(coordinator.navigationController)
        coordinator.parentCoordinator = self
        childCoordinators.append(coordinator)
    }
    
    func showCartFlow() {
        let coordinator = CartFlowCoordinator(tabBarController: tabBarController)
        coordinator.start()
        tabBarController.addChild(coordinator.navigationController)
        coordinator.parentCoordinator = self
        childCoordinators.append(coordinator)
    }
    
    func showFavorietsFlow() {
        
    }
    
    func showProfileFlow() {
        
    }
}
