//
//  CartView.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 23.01.2023.
//

import UIKit

class CartView: UIView {

    // MARK: Private properties
    
    private lazy var itemsTableView = {
        let view = UITableView()
        view.register(CartTableViewCell.self)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var footerView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var checkoutButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(.orange)
        return button
    }()
    
    // MARK: - Private properties
    
    weak var dataSource: UITableViewDataSource? {
        didSet {
            itemsTableView.dataSource = dataSource
        }
    }
    weak var delegate: UITableViewDelegate? {
        didSet {
            itemsTableView.delegate = delegate
        }
    }
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(.pink)
        addSubview(itemsTableView)
        addSubview(footerView)
        addSubview(checkoutButton)
        activateConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private funcs
    
    private func activateConstraints() {
        NSLayoutConstraint.activate([
            itemsTableView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            itemsTableView.leftAnchor.constraint(equalTo: leftAnchor),
            itemsTableView.rightAnchor.constraint(equalTo: rightAnchor),
            
            footerView.topAnchor.constraint(equalTo: itemsTableView.bottomAnchor),
            footerView.leftAnchor.constraint(equalTo: leftAnchor),
            footerView.rightAnchor.constraint(equalTo: rightAnchor),
            
            checkoutButton.topAnchor.constraint(equalTo: footerView.bottomAnchor, constant: 20),
            checkoutButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            checkoutButton.leftAnchor.constraint(equalTo: leftAnchor),
            checkoutButton.rightAnchor.constraint(equalTo: rightAnchor)
        ])
    }
    
    // MARK: - Public funcs
    
    func reloadData() {
        itemsTableView.reloadData()
    }
}
