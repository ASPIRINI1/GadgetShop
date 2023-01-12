//
//  DetailColorCollectionViewCell.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 24.12.2022.
//

import UIKit

class DetailColorCollectionViewCell: UICollectionViewCell {
    
    private lazy var imageView = {
        let view = UIImageView()
        let image = UIImage(systemName: "checkmark")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        view.image = image
        view.contentMode = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        addSubview(view)
        return view
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = frame.width / 2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Cell setup
    
    func fill(hexColor: String?) {
        guard let hexColor = hexColor else { return }
        backgroundColor = UIColor(hexColor)
        setNeedsLayout()
    }
    
    func set(selected: Bool) {
        imageView.isHidden = !selected
    }
    
    // MARK: - Layout
    
    override func updateConstraints() {
        super.updateConstraints()
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        imageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
}
