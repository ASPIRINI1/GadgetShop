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
    
    enum Sections: CaseIterable {
        case image, specs, color, capasity
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
    
    init(viewModel: DetailViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
            
        }
    }
}

// MARK: UICollectionViewDataSource

extension DetailViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        let collectionType = CollectionViews.allCases[collectionView.tag]
        print(collectionType.sections.count)
        return collectionType.sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionType = CollectionViews.allCases[collectionView.tag]
        let section = collectionType.sections[indexPath.section]
        switch section {
        case .image:
            let cell = collectionView.dequeue(DetailProductImageCell.self, indexPath)
            cell.fill(image: UIImage(systemName: "star"))
            cell.backgroundColor = .orange
            return cell
        case .specs:
            let cell = collectionView.dequeue(SpecsCollectionViewCell.self, indexPath)
            cell.backgroundColor = .red
            return cell
        case .color:
            let cell = collectionView.dequeue(SpecsCollectionViewCell.self, indexPath)
            cell.backgroundColor = .green
            return cell
        case .capasity:
            let cell = collectionView.dequeue(SpecsCollectionViewCell.self, indexPath)
            cell.backgroundColor = .blue
            return cell
        }
//        return UICollectionViewCell()
    }
}

// MARK: UICollectionViewDelegate

extension DetailViewController: UICollectionViewDelegate {
    
}
