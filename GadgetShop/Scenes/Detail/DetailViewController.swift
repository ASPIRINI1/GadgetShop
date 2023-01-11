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
    
    enum Specs: CaseIterable {
        case cpu
        case camera
        case ram
        case rom
    }
//
//    lazy var specs: [(image: UIImage?, title: String)]? = {
//        guard let product = viewModel.product else { return nil }
//        return [(UIImage(systemName: "star"), product.CPU),
//        (UIImage(systemName: "star"), product.camera),
//        (UIImage(systemName: "star"), product.sd),
//        (UIImage(systemName: "star"), product.ssd)]
//    }()
    
    //  MARK: - Init
    
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
        if let product = viewModel.product {
            customView.fill(title: product.title,
                            isFavoriets: product.isFavorites,
                            raiting: product.rating,
                            price: product.price)
        }
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewLoaded()
        viewModel.updateData = { [unowned self] in
            customView.reloadData()
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
            return Specs.allCases.count
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
            let cell = collectionView.dequeue(DetailProductImageCell.self, indexPath)
            cell.fill(viewModel.product?.imagesData?[indexPath.item])
            return cell
        case .specs:
            let cell = collectionView.dequeue(SpecsCollectionViewCell.self, indexPath)
            cell.backgroundColor = .red
            return cell
        case .color:
            let cell = collectionView.dequeue(DetailColorCell.self, indexPath)
            cell.fill(hexColor: viewModel.product?.color[indexPath.row])
            return cell
        case .capasity:
            let cell = collectionView.dequeue(SpecsCollectionViewCell.self, indexPath)
            cell.backgroundColor = .blue
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
    
}

// MARK: - UICollectionViewDelegateFlowLayout

extension DetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionType = CollectionViews.allCases[collectionView.tag]
        let section = collectionType.sections[indexPath.section]
        switch section {
        case .image:
            return CGSize(width: collectionView.frame.width * 0.75, height: collectionView.frame.height * 0.9)
        case .specs:
            return CGSize(width: 80, height: 100)
        case .color:
            return CGSize(width: 50, height: 50)
        case .capasity:
            return CGSize(width: 70, height: 31)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let collectionType = CollectionViews.allCases[collectionView.tag]
        switch collectionType {
        case .image:
            break
        case .detail:
            return .init(width: 0, height: 40)
        }
        return .zero
    }
}
