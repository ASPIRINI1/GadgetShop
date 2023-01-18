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
        (image: CustomInterfaceAssets.phone.uiImage, title: "Phones"),
        (image: CustomInterfaceAssets.monitor.uiImage, title: "Computer"),
        (image: CustomInterfaceAssets.heart.uiImage, title: "Health"),
        (image: CustomInterfaceAssets.book.uiImage, title: "Books"),
        (image: CustomInterfaceAssets.accessories.uiImage, title: "Else")]
    private var selectedCategoryIndex: IndexPath?

    enum Sections: Int, CaseIterable {
        case header = 0
        case categories = 1
        case searching = 2
        case homeStore = 3
        case bestSeller = 4
    }
    
    // MARK: - Init
    
    init(viewModel: MainViewModelProtocol) {
        self.viewModel = viewModel
        super.init(collectionViewLayout: MainCompositionalLayout())
        tabBarItem.image = UIImage(systemName: "bag")
        tabBarItem.selectedImage = UIImage(systemName: "bag.fill")
        tabBarItem.title = "Main"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        viewModel.viewLoaded()
        subscribeForViewModelUpdating()
    }
    
    // MARK: - Private funcs
    
    private func configureCollectionView() {
        collectionView.backgroundColor = .systemGray6
        collectionView.register(MainCollectionViewHeader.self, forSupplementaryViewOfKind: .header)
        collectionView.register(MainCategoryCollectionViewCell.self)
        collectionView.register(MainBestSellerCollectionViewCell.self)
        collectionView.register(MainHomeStoreCollectionViewCell.self)
        collectionView.register(MainSearchCollectionViewCell.self)
        collectionView.register(MainHeaderCollectionViewCell.self)
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
    
    private func handleCategorySelection(_ collectionView: UICollectionView, _ indexPath: IndexPath) {
        if let selectedCategoryIndex = selectedCategoryIndex {
            guard let cell = collectionView.cellForItem(at: selectedCategoryIndex) as? MainCategoryCollectionViewCell else { return }
            cell.set(selected: false)
        }
        guard indexPath != selectedCategoryIndex else {
            selectedCategoryIndex = nil
            return
        }
        selectedCategoryIndex = indexPath
        guard let cell = collectionView.cellForItem(at: indexPath) as? MainCategoryCollectionViewCell else { return }
        cell.set(selected: true)
    }
}

// MARK: - UICollectionViewDataSource

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
            let cell = collectionView.dequeue(MainHeaderCollectionViewCell.self, indexPath)
            cell.delegate = self
            cell.fill("Zihuatanejo, Gro")
            return cell
        case .categories:
            let cell = collectionView.dequeue(MainCategoryCollectionViewCell.self, indexPath)
            let category = categories[indexPath.item]
            cell.fill(image:category.image , title: category.title)
            cell.set(selected: indexPath == selectedCategoryIndex)
            return cell
        case .searching:
            let cell = collectionView.dequeue(MainSearchCollectionViewCell.self, indexPath)
            return cell
        case .homeStore:
            let cell = collectionView.dequeue(MainHomeStoreCollectionViewCell.self, indexPath)
            cell.fill(product: (viewModel.productList?.homeStore[indexPath.item])!)
            return cell
        case .bestSeller:
            let cell = collectionView.dequeue(MainBestSellerCollectionViewCell.self, indexPath)
            cell.fill(product: (viewModel.productList?.bestSeller[indexPath.item])!)
            return cell
        }
    }
}

// MARK: - UICollectionViewDelegate

extension MainCollectionViewController {
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.ReuseViewKind.header.stringValue {
            let sectionType = Sections.allCases[indexPath.section]
            let cell = collectionView.dequeue(MainCollectionViewHeader.self, ofKind: .header, indexPath: indexPath)
            
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
            viewModel.selecthomeStoreProductWith(indexPath.item)
        case .bestSeller:
            viewModel.selectBestSellerProductWith(indexPath.item)
        }
    }
}

// MARK: - HeaderCollectionViewCellDelegate

extension MainCollectionViewController: MainHeaderCollectionViewCellDelegate {
    func headerCollectionViewCelldidSelectGeoButton(_ cell: MainHeaderCollectionViewCell) {
        
    }
    
    func headerCollectionViewCelldidSelectFllerButton(_ cell: MainHeaderCollectionViewCell) {
        viewModel.selectFilterButton()
    }
}
