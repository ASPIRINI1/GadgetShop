//
//  FilterView.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 15.12.2022.
//

import UIKit

class FilterView: UIView {
    
    private lazy var headerView = {
        let left = RoundedButton(frame: .box,
                                  image: UIImage(systemName: "xmark"),
                                  title: nil,
                                  color: UIColor.CustomColor.pink.uiColor)
        let right = RoundedButton(frame: .long,
                                  image: nil,
                                  title: "Done",
                                  color: UIColor.CustomColor.orange.uiColor)
        left.addAction(closeButtonAction, for: .touchUpInside)
        right.addAction(doneButtonAction, for: .touchUpInside)
        let view = HeaderView(leftButton: left, title: "Filter options", rightButton: right)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    private lazy var tableView = {
        let view = UITableView(frame: .zero, style: .plain)
        view.backgroundColor = .clear
        view.separatorStyle = .none
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(FilterTableViewCell.self)
        return view
    }()
    weak var dataSource: UITableViewDataSource? {
        didSet {
            tableView.dataSource = dataSource
        }
    }
    weak var delegate: UITableViewDelegate? {
        didSet {
            tableView.delegate = delegate
        }
    }
    lazy var doneButtonPressed: (() -> ())? = nil
    lazy var closeButtonPressed: (() -> ())? = nil
    
    //  MARK: - Cell setup
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 20
        backgroundColor = .systemBackground
        addSubview(headerView)
        addSubview(tableView)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var doneButtonAction = UIAction { _ in
        self.doneButtonPressed?()
    }
    
    private lazy var closeButtonAction = UIAction { _ in
        self.closeButtonPressed?()
    }
    
    func getIndexPath(for cell: UITableViewCell) -> IndexPath? {
        return tableView.indexPath(for: cell)
    }
    
    //  MARK: - Layout
    
    override func updateConstraints() {
        super.updateConstraints()
        headerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        headerView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        headerView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        headerView.heightAnchor.constraint(equalToConstant: 70).isActive = true

        tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 20).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        tableView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
    }
}
