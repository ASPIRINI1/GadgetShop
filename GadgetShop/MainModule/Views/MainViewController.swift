//
//  MainViewController.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 05.12.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    private lazy var categoriesCollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: CategoryCollectionViewCell.self))
        return view
    }()
    private lazy var hotSalesCollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.register(HotSalesCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: HotSalesCollectionViewCell.self))
        return view
    }()
    private lazy var bestSellerCollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.register(BestSellerProductCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: BestSellerProductCollectionViewCell.self))
        return view
    }()
    private lazy var stackView = {
        let view = UIStackView()
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.addSubview(stackView)
        stackView.addSubview(categoriesCollectionView)
        stackView.addSubview(hotSalesCollectionView)
        stackView.addSubview(bestSellerCollectionView)
        stackView.center = view.center
    }
}
