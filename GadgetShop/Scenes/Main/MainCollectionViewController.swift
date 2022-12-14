//
//  MainCollectionViewController.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 11.12.2022.
//

import UIKit

private let reuseIdentifier = "Cell"

class MainCollectionViewController: UICollectionViewController {
    
    var viewModel: MainViewModelProtocol
    var categories: [(image: UIImage, title: String)] = [
        (image: UIImage(), title: "Phones"),
        (image: UIImage(), title: "Computer"),
        (image: UIImage(), title: "Health"),
        (image: UIImage(), title: "Books"),
        (image: UIImage(), title: "Else")]

    enum Sections: CaseIterable {
        case header
        case categories
        case searching
        case hotSales
        case bestSeller
    }
    
    init(viewModel: MainViewModelProtocol) {
        self.viewModel = viewModel
        super.init(collectionViewLayout: MainCompositionalLayout().setup())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        collectionView.register(CategoryCollectionViewCell.self)
        collectionView.register(BestSellerProductCollectionViewCell.self)
        collectionView.register(HotSalesCollectionViewCell.self)
        collectionView.register(SearchCollectionViewCell.self)
        collectionView.register(HeaderCollectionViewCell.self)
        viewModel.viewLoaded()
        
        viewModel.updateData = {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
}

//  MARK: - UICollectionViewDataSource

extension MainCollectionViewController {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Sections.allCases.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sectionType = Sections.allCases[section]
        switch sectionType {
        case .header:
            return 1
        case .categories:
            return categories.count
        case .searching:
            return 1
        case .hotSales:
            return viewModel.productList?.homeStore.count ?? 0
        case .bestSeller:
            return viewModel.productList?.bestSeller.count ?? 0
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sectionType = Sections.allCases[indexPath.section]
        switch sectionType {
        case .header:
            let cell = collectionView.dequeue(HeaderCollectionViewCell.self, indexPath)
            cell.fill("Zihuatanejo, Gro")
            return cell
        case .categories:
            let cell = collectionView.dequeue(CategoryCollectionViewCell.self, indexPath)
            cell.fill(image: UIImage(), title: "\(indexPath)")
            cell.backgroundColor = .black
            return cell
        case .searching:
            let cell = collectionView.dequeue(SearchCollectionViewCell.self, indexPath)
            cell.backgroundColor = .red
            return cell
        case .hotSales:
            let cell = collectionView.dequeue(HotSalesCollectionViewCell.self, indexPath)
            cell.fill(product: (viewModel.productList?.homeStore[indexPath.item])!)
            cell.backgroundColor = .green
            return cell
        case .bestSeller:
            let cell = collectionView.dequeue(BestSellerProductCollectionViewCell.self, indexPath)
            cell.fill(product: (viewModel.productList?.bestSeller[indexPath.item])!)
            cell.backgroundColor = .blue
            return cell
        }
    }
}

//  MARK: - UICollectionViewDelegate

extension MainCollectionViewController {
    
}
