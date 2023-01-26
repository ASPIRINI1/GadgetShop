//
//  CartViewController.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 23.01.2023.
//

import UIKit

class CartViewController: UIViewController {
    
    // MARK: Private properties
    
    private var viewModel: CartViewModelProtocol
    private let customView = CartBackgroundView()
    
    // MARK: - Init
    
    init(viewModel: CartViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        customView.dataSource = self
        customView.delegate = self
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subscribeForViewActions()
        subscribeForViewModelUpdating()
        viewModel.viewLoaded()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tabBarController?.tabBar.isHidden = false
    }
    
    // MARK: - Private funcs
    
    private func subscribeForViewModelUpdating() {
        viewModel.updateItemForIndex = { index in
            
        }
        viewModel.updateTotalPrice = { index in
            
        }
        viewModel.updateData = { [unowned self] in
            self.customView.reloadData()
        }
    }
    
    private func subscribeForViewActions() {
        customView.backButtonPressed = { [unowned self] in
            self.viewModel.selectBackButton()
        }
        customView.addressButtonPressed = { [unowned self] in
            self.viewModel.selectChangeAddressButton()
        }
    }
}

// MARK: - UITableViewDataSource

extension CartViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cart?.basket.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(CartTableViewCell.self, indexPath)
        cell.delegate = self
        cell.fill(viewModel.cart?.basket[indexPath.row])
        return cell
    }
}

// MARK: - UITableViewDelegate

extension CartViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

// MARK: - CartTableViewCellDelegate

extension CartViewController: CartTableViewCellDelegate {
    func cartTableViewCell(_ cell: UITableViewCell, didSelectProduct count: Int) {
        guard let indexPath = customView.getIndexPathFor(cell) else { return }
        viewModel.selectItemCountFor(indexPath.row, count: count)
    }
    
    func cartTableViewCellDidTapRemoveButton(_ cell: UITableViewCell) {
        guard let indexPath = customView.getIndexPathFor(cell) else { return }
        viewModel.removeItemFor(indexPath.row)
    }
}
