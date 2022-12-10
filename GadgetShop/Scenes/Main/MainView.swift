//
//  MainView.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 08.12.2022.
//

import UIKit

class MainView: UIView {
    
    lazy var categoriesCollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 75, height: 100)
        layout.scrollDirection = .horizontal
        layout.sectionInset.top = 10
        layout.sectionInset.left = 20
        layout.minimumLineSpacing = 25
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.tag = CollectionType.categories.rawValue
        view.register(CategoryCollectionViewCell.self)
        view.backgroundColor = .green
        return view
    }()
    lazy var hotSalesCollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 350, height: 200)
        layout.scrollDirection = .horizontal
        layout.sectionInset.left = 20
        layout.sectionInset.right = 20
        layout.minimumLineSpacing = 40
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.tag = CollectionType.hotSales.rawValue
        view.isPagingEnabled = true
        view.register(HotSalesCollectionViewCell.self)
        view.backgroundColor = .yellow
        return view
    }()
    lazy var bestSellerCollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.tag = CollectionType.bestSeller.rawValue
        view.register(BestSellerProductCollectionViewCell.self)
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
    
    weak var delegate: UICollectionViewDelegate? {
        didSet {
            categoriesCollectionView.delegate = delegate
            bestSellerCollectionView.delegate = delegate
            hotSalesCollectionView.delegate = delegate
        }
    }
    weak var dataSource: UICollectionViewDataSource? {
        didSet {
            categoriesCollectionView.dataSource = dataSource
            bestSellerCollectionView.dataSource = dataSource
            hotSalesCollectionView.dataSource = dataSource
        }
    }
    
    enum CollectionType: Int, CaseIterable {
        case categories = 0
        case bestSeller = 1
        case hotSales = 2
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubview(mainStackView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateProducts() {
        bestSellerCollectionView.reloadData()
        hotSalesCollectionView.reloadData()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        mainStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        mainStackView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor).isActive = true
        mainStackView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor).isActive = true
        categoriesCollectionView.heightAnchor.constraint(equalToConstant: 130).isActive = true
        searchStackView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        hotSalesCollectionView.heightAnchor.constraint(equalToConstant: 230).isActive = true
    }
}
