//
//  DetailViewModel.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 07.12.2022.
//

import Foundation

protocol DetailViewModelProtocol {
    var updateData: (() -> ())? { get set }
    var product: DetailProduct? { get set }
    var specs: [(image: Data?, title: String)]? { get }
    init(networkService: NetwokrServiceProtocol, coordinator: MainFlowCoordinatorProtocol, productID: Int)
    func viewLoaded()
    func backPressed()
    func addToCartPressed()
    func goToCartPressed()
    func colorSelected(colorNumber: Int)
    func capacitySelected(capacityNumber: Int)
    func tabSelected(index: Int)
}

final class DetailViewModel: DetailViewModelProtocol {
    
    var updateData: (() -> ())?
    var product: DetailProduct?
    var networkService: NetwokrServiceProtocol
    var coordinator: MainFlowCoordinatorProtocol
    var specs: [(image: Data?, title: String)]? { // hardcode
        guard let product = product else { return nil }
        return [(CustomCategoriesAssets.cpu.imageData, product.CPU),
                (CustomCategoriesAssets.camera.imageData, product.camera),
                (CustomCategoriesAssets.ram.imageData, product.sd),
                (CustomCategoriesAssets.rom.imageData, product.ssd)]
    }
    
    init(networkService: NetwokrServiceProtocol, coordinator: MainFlowCoordinatorProtocol, productID: Int) {
        self.networkService = networkService
        self.coordinator = coordinator
        loadProductWith(productID)
    }
    
    private func loadProductWith(_ id: Int) {
        networkService.getProductDetailFor(id: id) { product, error in
            self.product = product
            self.loadProductImage()
        }
    }
    
    private func loadProductImage() {
        guard let product = product else { return }
        networkService.getImageFor(urlString: product.images) { data, error in
            self.product?.imagesData = data
            self.updateData?()
        }
    }
    
    func viewLoaded() {
        
    }
    
    func backPressed() {
        coordinator.popViewController(animated: true)
    }
    
    func addToCartPressed() {
        
    }
    
    func goToCartPressed() {
        
    }
    
    func colorSelected(colorNumber: Int) {
        
    }
    
    func capacitySelected(capacityNumber: Int) {
        
    }
    
    func tabSelected(index: Int) {
        
    }
}
