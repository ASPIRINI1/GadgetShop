//
//  FiltreViewModel.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 15.12.2022.
//

import Foundation

protocol FilterViewModelProtocol {
    var filterOptions: FilterOptions { get set }
    func doneButtonPressrd()
    func setFilterForBrand(brand: String?)
    func setFilterForPrice(from: Int?, to: Int?)
    func setFilterForSize(from: Double?, to: Double?)
}

protocol FilterViewModelDelegate: AnyObject {
    func filterViewModel(_ viewModel: FilterViewModel, didSetFilter options: FilterOptions)
}

final class FilterViewModel: FilterViewModelProtocol {
    
    var filterOptions = FilterOptions()
    weak var delegate: FilterViewModelDelegate?

    func doneButtonPressrd() {
        delegate?.filterViewModel(self, didSetFilter: filterOptions)
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
