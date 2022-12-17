//
//  FiltreViewModel.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 15.12.2022.
//

import Foundation

protocol FilterViewModelProtocol {
    var filterOptions: FilterOptions { get set }
    var filter: (from: String, to: String)? { get set }
    func cancelButtonPressed()
    func doneButtonPressed(from: String, to: String)
    func setFilterForBrand(brand: String?)
    func setFilterForPrice(from: Int?, to: Int?)
    func setFilterForSize(from: Double?, to: Double?)
}

final class FilterViewModel: FilterViewModelProtocol {
    
    var filter: (from: String, to: String)?
    var filterOptions = FilterOptions()
    
    func viewLoaded() {
        
    }
    
    func cancelButtonPressed() {
        
    }
    
    func doneButtonPressed(from: String, to: String) {
        filter = (from, to)
    }
    
    func setFilterForBrand(brand: String?) {
        filterOptions.brand = brand
    }
    
    func setFilterForPrice(from: Int?, to: Int?) {
        filterOptions.price = (from, to)
    }
    
    func setFilterForSize(from: Double?, to: Double?) {
        filterOptions.size = (from, to)
    }
}
