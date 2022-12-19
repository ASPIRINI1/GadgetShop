//
//  FilterViewController.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 15.12.2022.
//

import UIKit

class FilterViewController: UIViewController {
    
    private let customView = FilterView(frame: .zero)
    private lazy var tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGesture))
    private var viewModel: FilterViewModelProtocol
    
    private enum FilterCellType: CaseIterable {
        case brand, price, size
    }
    
    init(viewModel: FilterViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        if let presentationController = self.presentationController as? UISheetPresentationController {
            presentationController.detents = [.medium()]
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //  MARK: - Lyfecycle
    
    override func loadView() {
        super.loadView()
        customView.dataSource = self
        view = customView
        view.addGestureRecognizer(tapGesture)
        subscribeViewActions()
    }
    
    //  MARK: - Actions
    
    @objc private func tapGesture(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    //  MARK: - CustomView actions handling
    
    private func subscribeViewActions() {
        customView.doneButtonPressed = { [unowned self] in
            self.dismiss(animated: true)
            viewModel.doneButtonPressrd()
        }
        
        customView.closeButtonPressed = { [unowned self] in
            self.dismiss(animated: true)
        }
    }
}

//  MARK: - UITableViewDelegate

extension FilterViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FilterCellType.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(FilterTableViewCell.self, indexPath)
        cell.delegate = self
        let sectionType = FilterCellType.allCases[indexPath.item]
        switch sectionType {
        case .brand:
            cell.fill(title: "Brand", viewModel.filterOptions.brands, .single)
            break
        case .price:
            cell.fill(title: "Price", viewModel.filterOptions.prices, .double)
            break
        case .size:
            cell.fill(title: "Size", viewModel.filterOptions.sizes, .double)
            break
        }
        return cell
    }
}

//  MARK: - FilterTableViewCellDelegate

extension FilterViewController: FilterTableViewCellDelegate {
    func filterTableViewCell(_ cell: FilterTableViewCell, didSelectFilterOptionsWith lhs: Any?, _ rhs: Any?) {
        guard let indexPath = customView.getIndexPath(for: cell) else { return }
        let cellType = FilterCellType.allCases[indexPath.item]
        switch cellType {
        case .brand:
            viewModel.setFilterForBrand(brand: lhs as? String)
        case .price:
            viewModel.setFilterForPrice(from: lhs as? Int, to: rhs as? Int)
        case .size:
            viewModel.setFilterForSize(from: lhs as? Double, to: rhs as? Double)
        }
    }
}
