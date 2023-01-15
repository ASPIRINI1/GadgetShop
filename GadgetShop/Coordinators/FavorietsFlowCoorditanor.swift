//
//  FavorietsFlowCoorditanor.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 15.01.2023.
//

import UIKit

protocol FavorietsFlowCoorditanorProtocol: CoordinatorProtocol {
    func pushToFavoriets(_ animated: Bool)
}

final class FavorietsFlowCoorditanor: FavorietsFlowCoorditanorProtocol {
    
    var tabBarController: UITabBarController
    var navigationController: UINavigationController
    var parentCoordinator: CoordinatorProtocol?
    var childCoordinators = [CoordinatorProtocol]()
    let flowFactory = FavorietsFlowFactory()
    
    init(tabBarController: UITabBarController) {
        self.tabBarController = tabBarController
        self.navigationController = UINavigationController()
        self.navigationController.isNavigationBarHidden = true
    }
    
    func start() {
        navigationController.setViewControllers([flowFactory.makeFavoriets(self)], animated: false)
    }
    
    func pushToFavoriets(_ animated: Bool) {
        navigationController.pushViewController(flowFactory.makeFavoriets(self), animated: animated)
    }
}
