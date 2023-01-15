//
//  ProfileFlowCoordinator.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 15.01.2023.
//

import UIKit

protocol ProfileFlowCoordinatorProtocol: CoordinatorProtocol {
    func pushToProfile(_ animated: Bool)
}

final class ProfileFlowCoordinator: ProfileFlowCoordinatorProtocol {
    
    var tabBarController: UITabBarController
    var navigationController: UINavigationController
    var parentCoordinator: CoordinatorProtocol?
    var childCoordinators = [CoordinatorProtocol]()
    let flowFactory = ProfileFlowFactory()
    
    init(tabBarController: UITabBarController) {
        self.tabBarController = tabBarController
        self.navigationController = UINavigationController()
        self.navigationController.isNavigationBarHidden = true
    }
    
    func start() {
        navigationController.setViewControllers([flowFactory.makeProfile(self)], animated: false)
    }
    
    func pushToProfile(_ animated: Bool) {
        navigationController.pushViewController(flowFactory.makeProfile(self), animated: animated)
    }
}
