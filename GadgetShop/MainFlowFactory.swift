//
//  FlowFactory.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 05.12.2022.
//

import UIKit

protocol MainFlowFactoryProtocol {
    func makeProductList(_ coordinator: MainFlowCoordinatorProtocol) -> UIViewController
    func makeCart(_ coordinator: MainFlowCoordinatorProtocol) -> UIViewController
    func makeDetail(_ coordinator: MainFlowCoordinatorProtocol) -> UIViewController
}

final class MainFlowFactory: MainFlowFactoryProtocol {
    
    let netwokrService = NetwokrService.shared
    
    func makeProductList(_ coordinator: MainFlowCoordinatorProtocol) -> UIViewController {
        let viewModel = MainViewModel(networkService: netwokrService, coordinator: coordinator)
        return MainCollectionViewController(viewModel: viewModel)
    }
    
    func makeCart(_ coordinator: MainFlowCoordinatorProtocol) -> UIViewController {
        return UIViewController()
    }
    
    func makeDetail(_ coordinator: MainFlowCoordinatorProtocol) -> UIViewController {
        return UIViewController()
    }
}
