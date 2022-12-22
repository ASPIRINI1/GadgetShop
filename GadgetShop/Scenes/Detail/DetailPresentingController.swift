//
//  DetailPresentingController.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 22.12.2022.
//

import UIKit

private let reuseIdentifier = "Cell"

class DetailPresentingController: UIViewController {
    
//    private var product: DetailProduct
    private var customView = DetailPresentingView()
    
    enum Sections: CaseIterable {
        case specs, color, capasity
    }
    
//    init(product: DetailProduct) {
//        self.product = product
//        super.init(nibName: nil, bundle: nil)
//    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Lifecycle
    
    override func loadView() {
        super.loadView()
        customView.dataSource = self
        customView.delegate = self
        customView.backgroundColor = .orange
        self.view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let presentationController = self.presentationController as? UISheetPresentationController {
            presentationController.detents = [.medium()]
        }
    }
}

// MARK: UICollectionViewDataSource

extension DetailPresentingController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Sections.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sectionType = Sections.allCases[indexPath.section]
        switch sectionType {
        case .specs:
            let cell = collectionView.dequeue(SpecsCollectionViewCell.self, indexPath)
            
            return cell
        case .color:
            let cell = collectionView.dequeue(SpecsCollectionViewCell.self, indexPath)
            
            return cell
        case .capasity:
            let cell = collectionView.dequeue(SpecsCollectionViewCell.self, indexPath)
            
            return cell
        }
    }
}

// MARK: UICollectionViewDelegate

extension DetailPresentingController: UICollectionViewDelegate {
    
}
