//
//  DetailImageCollectionViewCell.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 23.12.2022.
//

import UIKit

class DetailImageCollectionViewCell: UICollectionViewCell {
    
    private lazy var imageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.backgroundColor = .clear
        view.layer.cornerRadius = 20
        return view
    }()
    
    //  MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .lightGray
        layer.cornerRadius = 20
        layer.shadowRadius = 10
        layer.shadowOpacity = 0.1
        layer.shadowOffset = CGSize(width: 0, height: 10)
        addSubview(imageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //  MARK: - Public funcs
    
    func fill(_ imageData: Data?) {
        guard let imageData = imageData else { return }
        guard let image = UIImage(data: imageData) else { return }
        imageView.image = image
        setNeedsUpdateConstraints()
    }
    
    //  MARK: - Layout
    
    override func updateConstraints() {
        super.updateConstraints()
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        imageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
}
