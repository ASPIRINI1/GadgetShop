//
//  MainCollectionViewController.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 11.12.2022.
//

import UIKit

class MainCollectionViewController: UICollectionViewController {
    
    private var viewModel: MainViewModelProtocol
    private var categories: [(image: UIImage?, title: String)] = [
        (image: UIImage(.phone), title: "Phones"),
        (image: UIImage(.monitor), title: "Computer"),
        (image: UIImage(.heart), title: "Health"),
        (image: UIImage(.book), title: "Books"),
        (image: UIImage(.accessories), title: "Else")]
    private var selectedCategoryIndex: IndexPath?

    enum Sections: Int, CaseIterable {
        case header = 0
        case categories = 1
        case searching = 2
        case homeStore = 3
        case bestSeller = 4
    }
    
    init(viewModel: MainViewModelProtocol) {
        self.viewModel = viewModel
        super.init(collectionViewLayout: MainCompositionalLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //  MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        viewModel.viewLoaded()
        subscribeForViewModelUpdating()
    }
    
    private func subscribeForViewModelUpdating() {
        viewModel.updateData = { [unowned self] in
            self.collectionView.reloadData()
        }
        viewModel.updateHomeStoreForIndex = { [unowned self] index in
            self.collectionView.reloadItems(at: [IndexPath(item: index, section: Sections.homeStore.rawValue)])
        }
        viewModel.updateBestSellerForIndex = { [unowned self] index in
            self.collectionView.reloadItems(at: [IndexPath(item: index, section: Sections.bestSeller.rawValue)])
        }
    }
    
    private func configureCollectionView() {
        collectionView.backgroundColor = .systemGray6
        collectionView.register(CustomCollectionViewHeader.self, forSupplementaryViewOfKind: .header)
        collectionView.register(CategoryCollectionViewCell.self)
        collectionView.register(BestSellerProductCollectionViewCell.self)
        collectionView.register(HomeStoreCollectionViewCell.self)
        collectionView.register(SearchCollectionViewCell.self)
        collectionView.register(HeaderCollectionViewCell.self)
    }
    
    private func handleCategorySelection(_ collectionView: UICollectionView, _ indexPath: IndexPath) {
        if let selectedCategoryIndex = selectedCategoryIndex {
            guard let cell = collectionView.cellForItem(at: selectedCategoryIndex) as? CategoryCollectionViewCell else { return }
            cell.set(selected: false)
        }
        guard indexPath != selectedCategoryIndex else {
            selectedCategoryIndex = nil
            return
        }
        selectedCategoryIndex = indexPath
        guard let cell = collectionView.cellForItem(at: indexPath) as? CategoryCollectionViewCell else { return }
        cell.set(selected: true)
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
        case .homeStore:
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
            cell.delegate = self
            cell.fill("Zihuatanejo, Gro")
            return cell
        case .categories:
            let cell = collectionView.dequeue(CategoryCollectionViewCell.self, indexPath)
            let category = categories[indexPath.item]
            cell.fill(image:category.image , title: category.title)
            cell.set(selected: indexPath == selectedCategoryIndex)
            return cell
        case .searching:
            let cell = collectionView.dequeue(SearchCollectionViewCell.self, indexPath)
            return cell
        case .homeStore:
            let cell = collectionView.dequeue(HomeStoreCollectionViewCell.self, indexPath)
            cell.fill(product: (viewModel.productList?.homeStore[indexPath.item])!)
            return cell
        case .bestSeller:
            let cell = collectionView.dequeue(BestSellerProductCollectionViewCell.self, indexPath)
            cell.fill(product: (viewModel.productList?.bestSeller[indexPath.item])!)
            return cell
        }
    }
}

//  MARK: - UICollectionViewDelegate

extension MainCollectionViewController {
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.ReuseViewKind.header.stringValue {
            let sectionType = Sections.allCases[indexPath.section]
            let cell = collectionView.dequeue(CustomCollectionViewHeader.self, ofKind: .header, indexPath: indexPath)
            
            switch sectionType {
            case .header, .searching:
                break
            case .categories:
                cell.fill(title: "Select Category", buttonTitle: "view all")
            case .homeStore:
                cell.fill(title: "Hot sales", buttonTitle: "see more")
            case .bestSeller:
                cell.fill(title: "Best Seller", buttonTitle: "see more")
            }
            return cell
        }
        return UICollectionReusableView()
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sectionType = Sections.allCases[indexPath.section]
        switch sectionType {
        case .header, .searching:
            break
        case .categories:
            handleCategorySelection(collectionView, indexPath)
            viewModel.selectCategoryWith(id: indexPath.item)
        case .homeStore:
            viewModel.homeStoreProductSelected(indexPath.item)
        case .bestSeller:
            viewModel.bestSellerProductSelected(indexPath.item)
        }
    }
}

//  MARK: - HeaderCollectionViewCellDelegate

extension MainCollectionViewController: HeaderCollectionViewCellDelegate {
    func headerCollectionViewCelldidSelectGeoButton(_ cell: HeaderCollectionViewCell) {
        
    }
    
    func headerCollectionViewCelldidSelectFllerButton(_ cell: HeaderCollectionViewCell) {
        viewModel.filterButtonSeleced()
    }
}
