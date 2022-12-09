//
//  MainViewController.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 05.12.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    private var viewModel: MainViewModelProtocol
    lazy var customView = MainView(frame: .zero)
    var categories: [(image: UIImage, title: String)] = [
        (image: UIImage(), title: "String"),
        (image: UIImage(), title: "String"),
        (image: UIImage(), title: "String"),
        (image: UIImage(), title: "String"),
        (image: UIImage(), title: "String")]
    
    init(viewModel: MainViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //  MARK: Lifecycle
    
    override func loadView() {
        customView.dataSource = self
        customView.delegate = self
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewLoaded()
        viewModel.updateData = { [unowned self] in
            
        }
    }
}

//  MARK: - UICollectionViewDataSource

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let collectionViewType = MainView.CollectionType.allCases[collectionView.tag]
        switch collectionViewType {
        case .categories:
            return categories.count
        case .bestSeller:
            return viewModel.productList?.bestSeller.count ?? 0
        case .hotSales:
            return viewModel.productList?.homeStore.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionViewType = MainView.CollectionType.allCases[collectionView.tag]
        switch collectionViewType {
        case .categories:
            let cell = collectionView.dequeue(CategoryCollectionViewCell.self, indexPath)
            let category = categories[indexPath.row]
            cell.fill(image: category.image, title: category.title)
            return cell
        case .bestSeller:
            let cell = collectionView.dequeue(BestSellerProductCollectionViewCell.self, indexPath)
            guard let product = viewModel.productList?.bestSeller[indexPath.item] else { break }
            cell.fill(product: product)
            return cell
        case .hotSales:
            let cell = collectionView.dequeue(HotSalesCollectionViewCell.self, indexPath)
            guard let product = viewModel.productList?.homeStore[indexPath.item] else { break }
            cell.fill(product: product)
            return cell
        }
        return UICollectionViewCell()
    }
}

//  MARK: - UICollectionViewDelegate

extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let collectionViewType = MainView.CollectionType.allCases[collectionView.tag]
        switch collectionViewType {
        case .categories:
            viewModel.selectCategoryWith(id: indexPath.item)
        case .bestSeller:
            guard let product = viewModel.productList?.bestSeller[indexPath.item] else { break }
            viewModel.productSelected(productIndex: product.id)
        case .hotSales:
            guard let product = viewModel.productList?.homeStore[indexPath.item] else { break }
            viewModel.productSelected(productIndex: product.id)
        }
    }
}

