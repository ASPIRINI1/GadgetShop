//
//  MainViewModel.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 07.12.2022.
//

import Foundation

protocol MainViewModelProtocol {
    var updateData: (() -> ())? { get set }
    var productList: ProductList? { get set }
    init(networkService: NetwokrServiceProtocol, coordinator: MainFlowCoordinatorProtocol)
    func viewLoaded()
    func selectCategoryWith(id: Int)
    func cartSelected()
    func productSelected(productIndex: Int)
}

final class MainViewModel: MainViewModelProtocol {
    
    var updateData: (() -> ())?
    var productList: ProductList? {
        didSet {
            updateData?()
        }
    }
    var networkService: NetwokrServiceProtocol
    unowned var coordinator: MainFlowCoordinatorProtocol
    
    init(networkService: NetwokrServiceProtocol, coordinator: MainFlowCoordinatorProtocol) {
        self.networkService = networkService
        self.coordinator = coordinator
    }
    
    func viewLoaded() {
        networkService.getProductList { productList, errors in
            if let errors = errors {
                switch errors {
                case .noResponseFromServer:
                    break
                case .nilData:
                    break
                case .dataParsingError(let error):
                    break
                case .connectingError(let error):
                    break
                }
            }
            self.productList = productList
        }
    }
    
    func selectCategoryWith(id: Int) {
        
    }
    
    func cartSelected() {
        coordinator.presentCart()
    }
    
    func productSelected(productIndex: Int) {
        
    }
}
