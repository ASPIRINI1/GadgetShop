//
//  CartBackgroundView.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 05.02.2023.
//

import UIKit

class CartBackgroundView: UIView {
    
    // MARK: Private properties
    
    private var headerView = {
        let leftButton = RoundedButton(frame: .box,
                                       image: UIImage(systemName: "chevron.left"),
                                       title: nil,
                                       color: UIColor(.pink))
        let rightButton = RoundedButton(frame: .box,
                                        image: CustomInterfaceAssets.mapPoint.uiImage,
                                        title: nil,
                                        color: UIColor(.orange))
        let view = HeaderView(leftButton: leftButton, title: nil, rightButton: rightButton)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private var myCartLabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: .markProBold, size: 25)
        label.text = "My Cart"
        return label
    }()
    private var cartSubview = {
        let view = CartView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Public properties
    
    weak var dataSource: UITableViewDataSource? {
        didSet {
            cartSubview.dataSource = dataSource
        }
    }
    weak var delegate: UITableViewDelegate? {
        didSet {
            cartSubview.delegate = delegate
        }
    }
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        addSubview(headerView)
        addSubview(myCartLabel)
        addSubview(cartSubview)
        activateConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private funcs
    
    private func activateConstraints() {
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            headerView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            headerView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            
            myCartLabel.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 40),
            myCartLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            myCartLabel.rightAnchor.constraint(equalTo: rightAnchor),
            
            cartSubview.topAnchor.constraint(equalTo: myCartLabel.bottomAnchor, constant: 40),
            cartSubview.bottomAnchor.constraint(equalTo: bottomAnchor),
            cartSubview.leftAnchor.constraint(equalTo: leftAnchor),
            cartSubview.rightAnchor.constraint(equalTo: rightAnchor)
        ])
    }
    
    // MARK: - Public funcs
    
    func reloadData() {
        cartSubview.reloadData()
    }
}
