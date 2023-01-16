//
//  DetailViewController.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 07.12.2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    private var viewModel: DetailViewModelProtocol
    private var customView = DetailView()
    private var selectedColor: IndexPath?
    private var selectedCapasity: IndexPath?
    
    enum Sections: String, CaseIterable {
        case image, specs
        case color = "Color"
        case capasity = "Capasity"
    }
    
    enum CollectionViews: Int, CaseIterable {
        case image = 0
        case detail = 1
        
        var sections: [Sections] {
            switch self {
            case .image:
                return [.image]
            case .detail:
                return [.specs, .color, .capasity]
            }
        }
    }

    // hardcode
    var specs: [(image: UIImage?, title: String)]? {
        guard let product = viewModel.product else { return nil }
        return [(UIImage(.cpu), product.CPU),
                (UIImage(.camera), product.camera),
                (UIImage(.ram), product.sd),
                (UIImage(.rom), product.ssd)]
    }
    
    // MARK: - Init
    
    init(viewModel: DetailViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        customView.dataSource = self
        customView.delegate = self
        customView.viewDelegate = self
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subscribeForViewModelUpdating()
        viewModel.viewLoaded()
    }
    
    // MARK: - Private funcs
    
    private func subscribeForViewModelUpdating() {
        viewModel.updateData = { [unowned self] in
            customView.fill(product: viewModel.product)
        }
    }
}

// MARK: - UICollectionViewDataSource

extension DetailViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        let collectionType = CollectionViews.allCases[collectionView.tag]
        return collectionType.sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let collectionType = CollectionViews.allCases[collectionView.tag]
        let section = collectionType.sections[section]
        switch section {
        case .image:
            return viewModel.product?.images.count ?? 0
        case .specs:
            return specs?.count ?? 0
        case .color:
            return viewModel.product?.color.count ?? 0
        case .capasity:
            return viewModel.product?.capacity.count ?? 0
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionType = CollectionViews.allCases[collectionView.tag]
        let section = collectionType.sections[indexPath.section]
        switch section {
        case .image:
            let cell = collectionView.dequeue(DetailImageCollectionViewCell.self, indexPath)
            cell.fill(viewModel.product?.imagesData?[indexPath.item])
            return cell
        case .specs:
            let cell = collectionView.dequeue(DetailSpecsCollectionViewCell.self, indexPath)
            let spec = specs?[indexPath.item]
            cell.fill(image: spec?.image, title: spec?.title)
            return cell
        case .color:
            let cell = collectionView.dequeue(DetailColorCollectionViewCell.self, indexPath)
            cell.fill(hexColor: viewModel.product?.color[indexPath.row])
            if selectedColor == nil {
                selectedColor = indexPath
            }
            cell.set(selected: selectedColor == indexPath)
            return cell
        case .capasity:
            let cell = collectionView.dequeue(DetailCapasityCollectionViewCell.self, indexPath)
            cell.fill(title: viewModel.product?.capacity[indexPath.item])
            if selectedCapasity == nil {
                selectedCapasity = indexPath
            }
            cell.set(selected: selectedCapasity == indexPath)
            return cell
        }
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let collectionType = CollectionViews.allCases[collectionView.tag]
        switch collectionType {
        case .image:
            break
        case .detail:
            if kind == UICollectionView.ReuseViewKind.header.stringValue {
                let view = collectionView.dequeue(DetailCollectionHeaderView.self, ofKind: .header, indexPath: indexPath)
                view.fill(title: Sections.allCases[indexPath.section].rawValue)
                return view
            }
        }
        return UICollectionReusableView()
    }
}

// MARK: - UICollectionViewDelegate

extension DetailViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let collectionType = CollectionViews.allCases[collectionView.tag]
        let section = collectionType.sections[indexPath.section]
        switch section {
        case .image, .specs:
            break
        case .color:
            if let selectedColor = selectedColor,
               let cell = collectionView.cellForItem(at: selectedColor) as? DetailColorCollectionViewCell {
                cell.set(selected: false)
            }
            if let cell = collectionView.cellForItem(at: indexPath) as? DetailColorCollectionViewCell {
                cell.set(selected: true)
            }
            selectedColor = indexPath
            viewModel.colorSelected(colorNumber: indexPath.row)
        case .capasity:
            if let selectedCapasity = selectedCapasity,
               let cell = collectionView.cellForItem(at: selectedCapasity) as? DetailCapasityCollectionViewCell {
                cell.set(selected: false)
            }
            if let cell = collectionView.cellForItem(at: indexPath) as? DetailCapasityCollectionViewCell {
                cell.set(selected: true)
            }
            selectedCapasity = indexPath
            viewModel.capacitySelected(capacityNumber: indexPath.row)
        }
    }
}


// MARK: - UICollectionViewDelegateFlowLayout

extension DetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionType = DetailViewController.CollectionViews.allCases[collectionView.tag]
        let section = collectionType.sections[indexPath.section]
        switch section {
        case .image:
            return CGSize(width: collectionView.frame.width * 0.75, height: collectionView.frame.height * 0.9)
        case .specs:
            return CGSize(width: 80, height: 80)
        case .color:
            return CGSize(width: 50, height: 50)
        case .capasity:
            return CGSize(width: 70, height: 31)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let collectionType = DetailViewController.CollectionViews.allCases[collectionView.tag]
        switch collectionType {
        case .image:
            break
        case .detail:
            return .init(width: 0, height: 40)
        }
        return .zero
    }
}

extension DetailViewController: DetailViewDelegate {
    func detailViewDidTapBackButton(_ view: UIView) {
        viewModel.backPressed()
    }
    
    func detailViewDidTapGoToCartButton(_ view: UIView) {
        viewModel.goToCartPressed()
    }
    
    func detailViewDidTapAddToCartButton(_ view: UIView) {
        viewModel.addToCartPressed()
    }
    
    func detailView(_ view: UIView, didSelectTabWith index: Int) {
        viewModel.tabSelected(index: index)
    }
}
