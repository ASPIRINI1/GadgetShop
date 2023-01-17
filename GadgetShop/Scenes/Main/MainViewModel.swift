//
//  MainViewModel.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 07.12.2022.
//

import Foundation

protocol MainViewModelProtocol {
    var updateData: (() -> ())? { get set }
    var updateHomeStoreForIndex: ((Int) -> ())? { get set }
    var updateBestSellerForIndex: ((Int) -> ())? { get set }
    var productList: ProductList? { get set }
    init(networkService: NetwokrServiceProtocol, coordinator: MainFlowCoordinatorProtocol)
    func viewLoaded()
    func selectCategoryWith(id: Int)
    func filterButtonSeleced()
    func cartSelected()
    func homeStoreProductSelected(_ productIndex: Int)
    func bestSellerProductSelected(_ productIndex: Int)
}

final class MainViewModel: MainViewModelProtocol {
    
    var updateData: (() -> ())?
    var updateHomeStoreForIndex: ((Int) -> ())?
    var updateBestSellerForIndex: ((Int) -> ())?
    var productList: ProductList? {
        didSet {
            updateData?()
        }
    }
    var networkService: NetwokrServiceProtocol
    var coordinator: MainFlowCoordinatorProtocol
    var productCache: NSCache<AnyObject, AnyObject>?
    
    //  MARK: - Init
    
    init(networkService: NetwokrServiceProtocol, coordinator: MainFlowCoordinatorProtocol) {
        self.networkService = networkService
        self.coordinator = coordinator
    }
    
    //  MARK: - Private funcs
    
    private func loadProducts() {
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
            self.loadImagesForProducts()
        }
    }
    
    private func loadImagesForProducts() {
        guard let homeStore = productList?.homeStore else { return }
        for (index, product) in homeStore.enumerated() {
            networkService.getImageFor(urlString: product.picture) { imageData, errors in
                product.imageData = imageData
                self.updateHomeStoreForIndex?(index)
            }
        }
        guard let bestSellers = productList?.bestSeller else { return }
        for (index, product) in bestSellers.enumerated() {
            networkService.getImageFor(urlString: product.picture) { imageData, errors in
                product.imageData = imageData
                self.updateBestSellerForIndex?(index)
            }
        }
    }
    
    //  MARK: - Public funcs
    
    func viewLoaded() {
        loadProducts()
    }
    
    func selectCategoryWith(id: Int) {
        
    }
    
    func filterButtonSeleced() {
        coordinator.presentFilter(delegate: self, true)
    }
    
    func cartSelected() {
        
    }
    
    func homeStoreProductSelected(_ productIndex: Int) {
        guard let productID = productList?.homeStore[productIndex].id else { return }
        coordinator.pushToDetail(productID: productID, true)
    }
    
    func bestSellerProductSelected(_ productIndex: Int) {
        guard let productID = productList?.bestSeller[productIndex].id else { return }
        coordinator.pushToDetail(productID: productID, true)
    }
}

//  MARK: - FilterViewModelDelegate

extension MainViewModel: FilterViewModelDelegate {
    func filterViewModel(_ viewModel: FilterViewModel, didSetFilter options: FilterOptions) {
        
    }
}
