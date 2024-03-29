//
//  MainHomeStoreCollectionViewCell.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 05.12.2022.
//

import UIKit

protocol MainHomeStoreCollectionViewCellDelegate: AnyObject {
    func homeStoreCollectionViewCell(_ cell: MainHomeStoreCollectionViewCell, didTapBuyButtonForProductWith id: Int)
}

class MainHomeStoreCollectionViewCell: UICollectionViewCell {
    
    // MARK: Private properties
    
    private lazy var imageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleToFill
        return view
    }()
    private lazy var newMark = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = CustomInterfaceAssets.newMark.uiImage
        return view
    }()
    private lazy var brandLabel = {
        let label = UILabel()
        label.font = UIFont(name: .markProBold, size: 23)
        label.numberOfLines = 2
        label.textColor = .white
        return label
    }()
    private lazy var descriptionLabel = {
        let label = UILabel()
        label.font = UIFont(name: .markPro, size: 10)
        label.textColor = .white
        return label
    }()
    private lazy var buyButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont(name: .markProHeavy, size: 13)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        button.setTitle("Buy now!", for: .normal)
        button.addTarget(self, action: #selector(buyButtonAction), for: .touchUpInside)
        return button
    }()
    private lazy var labelStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.addArrangedSubview(brandLabel)
        view.addArrangedSubview(descriptionLabel)
        return view
    }()
    private var productID: Int = 0
    
    // MARK: - Public properties
    
    weak var delegate: MainHomeStoreCollectionViewCellDelegate?
    
    // MARK: - Init
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 10
        clipsToBounds = true
        addSubview(imageView)
        addSubview(labelStackView)
        addSubview(buyButton)
        addSubview(newMark)
        backgroundColor = .lightGray
        activateConstraints()
        setNeedsUpdateConstraints()
    }
    
    // MARK: - Public funcs
    
    private func activateConstraints() {
        newMark.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        newMark.leftAnchor.constraint(equalTo: buyButton.leftAnchor).isActive = true
        newMark.widthAnchor.constraint(equalToConstant: 25).isActive = true
        newMark.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        labelStackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        labelStackView.leftAnchor.constraint(equalTo: buyButton.leftAnchor).isActive = true
        labelStackView.widthAnchor.constraint(equalTo: buyButton.widthAnchor).isActive = true
            
        buyButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -25).isActive = true
        buyButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        buyButton.heightAnchor.constraint(equalToConstant: 31).isActive = true
        buyButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        imageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
    }
    
    // MARK: - Public funcs
    
    func fill(product: HomeStoreProduct) {
        productID = product.id
        brandLabel.text = product.title
        descriptionLabel.text = product.subtitle
        guard let imageData = product.imageData else { return }
        imageView.image = UIImage(data: imageData)
    }
    
    // MARK: - Actions
    
    @objc private func buyButtonAction(_ sender: UIButton) {
        delegate?.homeStoreCollectionViewCell(self, didTapBuyButtonForProductWith: productID)
    }
}
