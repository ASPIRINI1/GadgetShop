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
    func makeDetail(_ coordinator: MainFlowCoordinatorProtocol, productID: Int) -> UIViewController
    func makeFilter(_ coordinator: MainFlowCoordinatorProtocol, delegate: FilterViewModelDelegate?)  -> UIViewController
}

final class MainFlowFactory: MainFlowFactoryProtocol {
    
    let netwokrService = NetwokrService.shared
    
    func makeProductList(_ coordinator: MainFlowCoordinatorProtocol) -> UIViewController {
        let viewModel = MainViewModel(networkService: netwokrService, coordinator: coordinator)
        return MainCollectionViewController(viewModel: viewModel)
    }
    
    func makeCart(_ coordinator: MainFlowCoordinatorProtocol) -> UIViewController {
        let vc = UIViewController()
        vc.tabBarItem.image = UIImage(systemName: "star")
        vc.tabBarItem.title = "Cart"
        return vc
    }
    
    func makeDetail(_ coordinator: MainFlowCoordinatorProtocol, productID: Int) -> UIViewController {
        let viewModel = DetailViewModel(networkService: netwokrService, coordinator: coordinator, productID: productID)
        return DetailViewController(viewModel: viewModel)
    }
    
    func makeFilter(_ coordinator: MainFlowCoordinatorProtocol, delegate: FilterViewModelDelegate?)  -> UIViewController {
        let viewModel = FilterViewModel()
        viewModel.delegate = delegate
        return FilterViewController(viewModel: viewModel)
    }
}
