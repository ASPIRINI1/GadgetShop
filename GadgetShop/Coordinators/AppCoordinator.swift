//
//  AppCoordinator.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 04.12.2022.
//

import UIKit

class AppCoordinator: CoordinatorProtocol {
    
    var navigationController: UINavigationController
    var parentCoordinator: CoordinatorProtocol?
    var childCoordinators = [CoordinatorProtocol]()

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let mainFlowCoordinator = MainFlowCoordinator(navigationController: navigationController)
        mainFlowCoordinator.start()
    }
}
