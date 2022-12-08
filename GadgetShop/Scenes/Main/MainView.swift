//
//  MainView.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 08.12.2022.
//

import UIKit

class MainView: UIView {
    
    private lazy var categoriesCollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.delegate = self.delegate
        view.dataSource = self.dataSource
        view.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: CategoryCollectionViewCell.self))
        view.backgroundColor = .green
        return view
    }()
    private lazy var hotSalesCollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.delegate = self.delegate
        view.dataSource = self.dataSource
        view.register(HotSalesCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: HotSalesCollectionViewCell.self))
        view.backgroundColor = .yellow
        return view
    }()
    private lazy var bestSellerCollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.delegate = self.delegate
        view.dataSource = self.dataSource
        view.register(BestSellerProductCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: BestSellerProductCollectionViewCell.self))
        view.backgroundColor = .brown
        return view
    }()
    private lazy var headerStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.backgroundColor = .red
        return view
    }()
    private lazy var searchStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.addArrangedSubview(UISearchBar())
        view.addArrangedSubview(UIButton())
        view.backgroundColor = .blue
        return view
    }()
    private lazy var mainStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addArrangedSubview(categoriesCollectionView)
        view.addArrangedSubview(searchStackView)
        view.addArrangedSubview(hotSalesCollectionView)
        view.addArrangedSubview(bestSellerCollectionView)
        view.backgroundColor = .lightGray
        return view
    }()
    
    weak var delegate: UICollectionViewDelegate?
    weak var dataSource: UICollectionViewDataSource?
    
    enum CollectionTypes {
        case categories, bestSeller, hotSales
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(mainStackView)
        backgroundColor = .white
        setNeedsUpdateConstraints()
    }
    
    func fill() {
        
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        mainStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        mainStackView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor).isActive = true
        mainStackView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor).isActive = true
        categoriesCollectionView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        searchStackView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        hotSalesCollectionView.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
}
