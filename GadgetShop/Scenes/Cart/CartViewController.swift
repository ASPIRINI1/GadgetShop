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
        subscribeForViewModelUpdating()
        viewModel.viewLoaded()
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
}

// MARK: - UITableViewDataSource

extension CartViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cart?.basket.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(CartTableViewCell.self, indexPath)
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
