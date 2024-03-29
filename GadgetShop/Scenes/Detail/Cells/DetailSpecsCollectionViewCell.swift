//
//  DetailSpecsCollectionViewCell.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 22.12.2022.
//

import UIKit

class DetailSpecsCollectionViewCell: UICollectionViewCell {
    
    // MARK: Private properties
    
    private lazy var imageView = {
        let view = UIImageView()
        view.tintColor = .systemGray4
        view.contentMode = .scaleAspectFit
        return view
    }()
    private lazy var titleLabel = {
        let label = UILabel()
        label.font = UIFont(name: .markPro, size: 12)
        label.textColor = .systemGray4
        label.textAlignment = .center
        return label
    }()
    private lazy var stackView = {
        let view = UIStackView(arrangedSubviews: [imageView, titleLabel])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.distribution = .fillEqually
        return view
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(stackView)
        activateConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private funcs
    
    private func activateConstraints() {
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
    
    // MARK: - Public funcs
    
    func fill(imageData: Data?, title: String?) {
        titleLabel.text = title
        guard let imageData = imageData else { return }
        imageView.image = UIImage(data: imageData)?.withRenderingMode(.alwaysTemplate)
    }
}
