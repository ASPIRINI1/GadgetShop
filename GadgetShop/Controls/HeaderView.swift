//
//  HeaderView.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 15.12.2022.
//

import UIKit

class HeaderView: UIStackView {

    private var leftButton = UIButton()
    private var rightButton = UIButton()
    private var titleLabel = {
        let label = UILabel()
        label.font = UIFont(name: .markProMedium, size: 17)
        return label
    }()
    
    init(leftButton: UIButton?, title: String?, rightButton: UIButton?) {
        super.init(frame: .zero)
        axis = .horizontal
        distribution = .equalCentering
        alignment = .center
        if let leftButton = leftButton {
            self.leftButton = leftButton
        }
        if let rightButton = rightButton {
            self.rightButton = rightButton
        }
        self.titleLabel.text = title
        addArrangedSubview(self.leftButton)
        addArrangedSubview(titleLabel)
        addArrangedSubview(self.rightButton)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
