//
//  CartViewModel.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 23.01.2023.
//

import Foundation

protocol CartViewModelProtocol {
    var cart: Cart? { get set }
    var updateItemForIndex: ((Int) -> ())? { get set }
    var updateTotalPrice: ((Int) -> ())? { get set }
    var updateData: (() -> ())? { get set }
    func viewLoaded()
    func removeItemFor(_ index: Int)
    func addItemCountFor( _ index: Int)
    func removeItemCountFor( _ index: Int)
    func selectCheckoutButton()
    func selectChangeAddressButton()
}

final class CartViewModel: CartViewModelProtocol {
    
    // MARK: Private properties
    
    private let networkService: NetwokrServiceProtocol
    private let coordinator: CartFlowCoordinatorProtocol
    
    // MARK: - Public properties
    
    var cart: Cart?
    var updateItemForIndex: ((Int) -> ())?
    var updateTotalPrice: ((Int) -> ())?
    var updateData: (() -> ())?
    
    // MARK: - Init
    
    init(networkService: NetwokrServiceProtocol, coordinator: CartFlowCoordinatorProtocol) {
        self.networkService = networkService
        self.coordinator = coordinator
    }
    
    // MARK: - CartViewModelProtocol funcs
    
    func viewLoaded() {
        networkService.getCart { cart, errors in
            self.cart = cart
            switch errors {
            case .none:
                break
            case .some(let error):
                print(error)
            }
//            self.updateItemForIndex?(0)
            self.updateData?()
        }
//        guard let basket = cart?.basket else { return }
//        for item in basket {
//            networkService.getImageFor(urlString: item.images) { image, error in
//                guard let image = image else { return }
//                item.imageData = image
//                self.updateItemForIndex?(0)
//            }
//        }
    }
    
    func removeItemFor(_ index: Int) {
        
    }
    
    func addItemCountFor(_ index: Int) {
        
    }
    
    func removeItemCountFor(_ index: Int) {
        
    }
    
    func selectCheckoutButton() {
        
    }
    
    func selectChangeAddressButton() {
        
    }
}
