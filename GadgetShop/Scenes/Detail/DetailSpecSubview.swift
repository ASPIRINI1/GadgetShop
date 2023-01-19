//
//  DetailPresentingView.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 20.12.2022.
//

import UIKit

class DetailSpecSubview: UIView {
    
    // MARK: - Private properies
    
    private lazy var productNameLabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: .markPro, size: 20)
        return label
    }()
    private lazy var raitingStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.tintColor = .systemYellow
        for i in 0...4 {
            view.addArrangedSubview(UIImageView(image:UIImage(systemName: "star")))
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
        let control = MaterialSegmentedControl(frame: .zero, items: ["Shop", "Details", "Features"])
        control.translatesAutoresizingMaskIntoConstraints = false
        control.delegate = self
        return control
    }()
    private lazy var specsCollection = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.register(DetailSpecsCollectionViewCell.self)
        view.register(DetailColorCollectionViewCell.self)
        view.register(DetailCapasityCollectionViewCell.self)
        view.register(DetailCollectionHeaderView.self, forSupplementaryViewOfKind: .header)
        view.tag = DetailViewController.CollectionViews.detail.rawValue
        return view
    }()
    private lazy var buyButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.CustomColor.orange.uiColor
        button.layer.cornerRadius = 10
        button.setTitleColor(.white, for: .normal)
        button.addAction(buyButtonAction, for: .touchUpInside)
        return button
    }()
    
    // MARK: - Public properies
    
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
    
    // MARK: - Callbacks
    
    lazy var buyButtonPressed: (() -> ())? = nil
    lazy var tabSegmentSelected: ((Int) -> ())? = nil

    private enum RaitingStars: String {
        case star = "star"
        case halfFilledStar = "star.leadinghalf.filled"
        case filledStar = "star.fill"
    }
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        layer.cornerRadius = 20
        layer.shadowRadius = 20
        layer.shadowOpacity = 0.1
        addSubview(productNameLabel)
        addSubview(raitingStackView)
        addSubview(addToFavorietsButton)
        addSubview(categorySegmentedControl)
        addSubview(specsCollection)
        addSubview(buyButton)
        activateConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private funcs
    
    private func activateConstraints() {
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
    
    // MARK: - Public funcs
    
    func fill(product: DetailProduct?) {
        guard let product = product else { return }
        productNameLabel.text = product.title
        addToFavorietsButton.isSelected = product.isFavorites
        buyButton.setTitle("Add to cart $\(product.price)", for: .normal)
        for (index, item) in raitingStackView.arrangedSubviews.enumerated() {
            guard let item = item as? UIImageView else { break }
            if Float(index + 1) > product.rating {
                if Float(index + 1) - product.rating < 0.7 {
                    item.image = UIImage(systemName: RaitingStars.halfFilledStar.rawValue)
                } else {
                    item.image = UIImage(systemName: RaitingStars.star.rawValue)
                }
                continue
            }
            item.image = UIImage(systemName: RaitingStars.filledStar.rawValue)
        }
    }
    
    func reloadData() {
        specsCollection.reloadData()
    }
    
    // MARK: - Actions
    
    private lazy var buyButtonAction = UIAction { [unowned self] action in
        self.buyButtonPressed?()
        guard let button = action.sender as? UIButton else { return }
        UIView.animate(withDuration: 0.2) {
            button.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        } completion: { _ in
            UIView.animate(withDuration: 0.2) {
                button.transform = CGAffineTransform.identity
            }
        }
    }
}

// MARK: - MaterialSegmentedControlDelegate

extension DetailSpecSubview: MaterialSegmentedControlDelegate {
    func materialSegmentedControl(_ control: MaterialSegmentedControl, didSelectItemAt index: Int) {
        tabSegmentSelected?(index)
    }
}
