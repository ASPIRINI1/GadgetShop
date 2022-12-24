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
                                       image: UIImage(systemName: "chevron.left"),
                                       title: nil,
                                       color: UIColor.CustomColor.pink.uiColor)
        let rightButton = RoundedButton(frame: .box,
                                        image: UIImage(systemName: "bag"),
                                        title: nil,
                                        color: UIColor.CustomColor.orange.uiColor)
        let view = HeaderView(leftButton: leftButton, title: "Product Details", rightButton: rightButton)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var imageCollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = .init(top: 20, left: 20, bottom: 20, right: 20)
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isPagingEnabled = true
        view.showsHorizontalScrollIndicator = false
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
    
    //  MARK: - Init
    
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
    
    //  MARK: - Public funcs
    
    func fill(title: String, isFavoriets: Bool, raiting: Float, price: Int) {
        specsSubview.fill(title: title, isFavoriets: isFavoriets, raiting: raiting, price: price)
    }
    
    func reloadData() {
        imageCollectionView.reloadData()
        specsSubview.reloadData()
    }
    
    //  MARK: - Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let imageCollectionViewLayout = imageCollectionView.collectionViewLayout as? UICollectionViewFlowLayout
        imageCollectionViewLayout?.itemSize = CGSize(width: imageCollectionView.frame.width * 0.8,
                             height: imageCollectionView.frame.height * 0.8)
    }
    
    override func updateConstraints() {
        super.updateConstraints()
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
}
