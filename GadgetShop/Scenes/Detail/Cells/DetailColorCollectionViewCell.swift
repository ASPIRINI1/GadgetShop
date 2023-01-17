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
        view.topAnchor.constraint(equalTo: topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        view.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        view.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
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
    
    // MARK: - Public funcs
    
    func fill(hexColor: String?) {
        guard let hexColor = hexColor else { return }
        backgroundColor = UIColor(hexColor)
        setNeedsLayout()
    }
    
    func set(selected: Bool) {
        UIView.transition(with: imageView, duration: 0.3, options: .transitionCrossDissolve) {
            self.imageView.isHidden = !selected
        }
    }
}
