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
    
    private func addCoordinator(_ coordinator: CoordinatorProtocol) {
        coordinator.start()
        tabBarController.addChild(coordinator.navigationController)
        coordinator.parentCoordinator = self
        childCoordinators.append(coordinator)
    }
    
    func start() {
        showMainFlow()
        showCartFlow()
        showFavorietsFlow()
        showProfileFlow()
    }
    
    func showMainFlow() {
        addCoordinator(MainFlowCoordinator(tabBarController: tabBarController))
    }
    
    func showCartFlow() {
        addCoordinator(CartFlowCoordinator(tabBarController: tabBarController))
    }
    
    func showFavorietsFlow() {
        addCoordinator(FavorietsFlowCoorditanor(tabBarController: tabBarController))
    }
    
    func showProfileFlow() {
        
    }
}
