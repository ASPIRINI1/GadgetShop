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
    init(networkService: NetwokrServiceProtocol, coordinator: MainFlowCoordinatorProtocol, productID: Int)
    func viewLoaded()
    func backPressed()
    func addToCartPressed()
    func colorSelected(colorNumber: Int)
    func capacitySelected(capacityNumber: Int)
}

final class DetailViewModel: DetailViewModelProtocol {
    
    var updateData: (() -> ())?
    var product: DetailProduct?
    var networkService: NetwokrServiceProtocol
    var coordinator: MainFlowCoordinatorProtocol
    
    init(networkService: NetwokrServiceProtocol, coordinator: MainFlowCoordinatorProtocol, productID: Int) {
        self.networkService = networkService
        self.coordinator = coordinator
    }
    
    func viewLoaded() {
        
    }
    
    func backPressed() {
        
    }
    
    func addToCartPressed() {
        
    }
    
    func colorSelected(colorNumber: Int) {
        
    }
    
    func capacitySelected(capacityNumber: Int) {
        
    }
}
