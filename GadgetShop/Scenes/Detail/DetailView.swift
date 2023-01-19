//
//  DetailView.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 20.12.2022.
//

import UIKit

protocol DetailViewDelegate: AnyObject {
    func detailViewDidTapBackButton(_ view: UIView)
    func detailViewDidTapGoToCartButton(_ view: UIView)
    func detailViewDidTapAddToCartButton(_ view: UIView)
    func detailView(_ view: UIView, didSelectTabWith index: Int)
}

class DetailView: UIView {
    
    // MARK:  Private properies

    private lazy var headerView = {
        let leftButton = RoundedButton(frame: .box,
                                       image: UIImage(systemName: "chevron.left"),
                                       title: nil,
                                       color: UIColor.CustomColor.pink.uiColor)
        let rightButton = RoundedButton(frame: .box,
                                        image: UIImage(systemName: "bag"),
                                        title: nil,
                                        color: UIColor.CustomColor.orange.uiColor)
        leftButton.addAction(backButtonAction, for: .touchUpInside)
        rightButton.addAction(goToCartButtonAction, for: .touchUpInside)
        let view = HeaderView(leftButton: leftButton, title: "Product Details", rightButton: rightButton)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var imageCollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = .init(top: 0, left: 40, bottom: 0, right: 40)
        layout.minimumLineSpacing = 30
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isPagingEnabled = true
        view.showsHorizontalScrollIndicator = false
        view.backgroundColor = .clear
        view.register(DetailImageCollectionViewCell.self)
        view.tag = DetailViewController.CollectionViews.image.rawValue
        return view
    }()
    private lazy var specsSubview = {
        let view = DetailSpecSubview()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Public properies
    
    weak var dataSource: UICollectionViewDataSource? {
        didSet {
            imageCollectionView.dataSource = dataSource
            specsSubview.dataSource = dataSource
        }
    }
    weak var delegate: UICollectionViewDelegate? {
        didSet {
            imageCollectionView.delegate = delegate
            specsSubview.delegate = delegate
        }
    }
    weak var viewDelegate: DetailViewDelegate?
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground.withAlphaComponent(0.98)
        addSubview(headerView)
        addSubview(imageCollectionView)
        addSubview(specsSubview)
        activateConstraints()
        subscribeForDetailViewCallbacks()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private funcs
    
    private func subscribeForDetailViewCallbacks() {
        specsSubview.buyButtonPressed = {
            
        }
        specsSubview.tabSegmentSelected = { [unowned self] tabIndex in
            self.viewDelegate?.detailView(self, didSelectTabWith: tabIndex)
        }
    }
    
    private func activateConstraints() {
        headerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        headerView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        headerView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        
        imageCollectionView.topAnchor.constraint(equalTo: headerView.bottomAnchor).isActive = true
        imageCollectionView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        imageCollectionView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        imageCollectionView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4).isActive = true
        
        specsSubview.topAnchor.constraint(equalTo: imageCollectionView.bottomAnchor).isActive = true
        specsSubview.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        specsSubview.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        specsSubview.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
    
    // MARK: - Public funcs
    
    func fill(product: DetailProduct?) {
        specsSubview.fill(product: product)
        imageCollectionView.reloadData()
        specsSubview.reloadData()
    }
    
    // MARK: - Actions
    
    private lazy var backButtonAction = UIAction { [unowned self] _ in
        self.viewDelegate?.detailViewDidTapBackButton(self)
    }
    
    private lazy var goToCartButtonAction = UIAction { [unowned self] _ in
        self.viewDelegate?.detailViewDidTapGoToCartButton(self)
    }
    
    private lazy var addToCartButtonAction = UIAction { [unowned self] _ in
        self.viewDelegate?.detailViewDidTapAddToCartButton(self)
    }
}
