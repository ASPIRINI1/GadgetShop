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
        let mainFlowCoordinator = MainFlowCoordinator(tabBarController: tabBarController, navigationController: navigationController)
        mainFlowCoordinator.start()
        mainFlowCoordinator.parentCoordinator = self
        childCoordinators.append(mainFlowCoordinator)
    }
}
