//
//  DetailPresentingView.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 20.12.2022.
//

import UIKit

class DetailPresentingView: UIView {
    
    private lazy var productNameLabel = {
        let label = UILabel()
        return label
    }()
    private lazy var raitingStackView = {
        let imageView = UIImageView(image:UIImage(systemName: "star"))
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        for i in 0...5 {
            view.addArrangedSubview(imageView)
        }
        return view
    }()
    private lazy var addToFavorietsButton = {
        let button = UILabel()
        return button
    }()
    private lazy var categorySegmentedControl = {
        let control = UISegmentedControl(items: ["Shop", "Details", "Features"])
        return control
    }()
    private lazy var specsCollection = {
        let view = UICollectionView()
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        super.updateConstraints()
    }
}
