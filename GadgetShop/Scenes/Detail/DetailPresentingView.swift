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
        label.translatesAutoresizingMaskIntoConstraints = false
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
        let button = RoundedButton(frame: .box,
                                   image: UIImage(systemName: "heart"),
                                   title: nil,
                                   color: UIColor.CustomColor.pink.uiColor)
        return button
    }()
    private lazy var categorySegmentedControl = {
        let control = UISegmentedControl(items: ["Shop", "Details", "Features"])
        control.translatesAutoresizingMaskIntoConstraints = false
        control.selectedSegmentIndex = 0
        return control
    }()
    private lazy var specsCollection = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(SpecsCollectionViewCell.self)
        return view
    }()
    private lazy var buyButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .blue
        button.layer.cornerRadius = 10
        return button
    }()
    weak var dataSource: UICollectionViewDataSource? {
        didSet {
            specsCollection.dataSource = dataSource
        }
    }
    weak var delegate: UICollectionViewDelegate? {
        didSet {
            specsCollection.delegate = delegate
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        productNameLabel.text = "text sample"
        addSubview(productNameLabel)
        addSubview(raitingStackView)
        addSubview(addToFavorietsButton)
        addSubview(categorySegmentedControl)
        addSubview(specsCollection)
        addSubview(buyButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        productNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        productNameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        
        addToFavorietsButton.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        addToFavorietsButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        addToFavorietsButton.leftAnchor.constraint(greaterThanOrEqualTo: productNameLabel.rightAnchor, constant: 10).isActive = true
        
        raitingStackView.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor, constant: 5).isActive = true
        raitingStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        
        categorySegmentedControl.topAnchor.constraint(equalTo: raitingStackView.bottomAnchor, constant: 20).isActive = true
        categorySegmentedControl.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        categorySegmentedControl.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        
        buyButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
        buyButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        buyButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        buyButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        specsCollection.topAnchor.constraint(equalTo: categorySegmentedControl.bottomAnchor, constant: 10).isActive = true
        specsCollection.bottomAnchor.constraint(equalTo: buyButton.topAnchor, constant: -10).isActive = true
        specsCollection.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        specsCollection.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
    }
}
