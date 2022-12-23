//
//  DetailView.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 20.12.2022.
//

import UIKit

class DetailView: UIView {

    private lazy var headerView = {
        let leftButton = RoundedButton(frame: .box,
                                       image: UIImage(systemName: ""),
                                       title: nil,
                                       color: UIColor.CustomColor.pink.uiColor)
        let rightButton = RoundedButton(frame: .box,
                                        image: UIImage(systemName: ""),
                                        title: nil,
                                        color: UIColor.CustomColor.orange.uiColor)
        let view = HeaderView(leftButton: leftButton, title: "Product Details", rightButton: rightButton)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var imageCollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(DetailProductImageCell.self)
        view.tag = DetailViewController.CollectionViews.image.rawValue
        return view
    }()
    private lazy var specsSubview = {
        let view = DetailSpecSubview()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        addSubview(headerView)
        addSubview(imageCollectionView)
        addSubview(specsSubview)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func fill(title: String, isFavoriets: Bool, raiting: Float, price: Int) {
        specsSubview.fill(title: title, isFavoriets: isFavoriets, raiting: raiting, price: price)
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        headerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        headerView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        headerView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        imageCollectionView.topAnchor.constraint(equalTo: headerView.bottomAnchor).isActive = true
        imageCollectionView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        imageCollectionView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        imageCollectionView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4).isActive = true
        
        specsSubview.topAnchor.constraint(equalTo: imageCollectionView.bottomAnchor).isActive = true
        specsSubview.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        specsSubview.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        specsSubview.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
}
