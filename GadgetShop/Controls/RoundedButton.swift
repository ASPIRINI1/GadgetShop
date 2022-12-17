//
//  RoundedButton.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 15.12.2022.
//

import UIKit

class RoundedButton: UIButton {
    
    enum RoundedButtonSize {
        case box, long
        var cgRect: CGRect {
            switch self {
            case .box:
                return CGRect(x: 0, y: 0, width: 40, height: 40)
            case .long:
                return CGRect(x: 0, y: 0, width: 70, height: 40)
            }
        }
    }

    init(frame: RoundedButtonSize, image: UIImage?, title: String?, color: UIColor?) {
        super.init(frame: frame.cgRect)
        backgroundColor = color
        layer.cornerRadius = 10
        tintColor = .white
        contentEdgeInsets = .init(top: 10, left: 10, bottom: 10, right: 10)
        setImage(image, for: .normal)
        setTitle(title, for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: frame.cgRect.height).isActive = true
        widthAnchor.constraint(equalToConstant: frame.cgRect.width).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
