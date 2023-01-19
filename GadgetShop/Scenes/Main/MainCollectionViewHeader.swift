//
//  MainCollectionViewHeader.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 14.12.2022.
//

import UIKit

class MainCollectionViewHeader: UICollectionReusableView {
    
    // MARK: Private properties
    
    private lazy var titleLabel = {
        let label = UILabel()
        label.font = UIFont(name: .markProBold, size: 23)
        return label
    }()
    private lazy var button = {
        let button = UIButton()
        button.titleLabel?.font = UIFont(name: .markPro, size: 17)
        button.setTitleColor(UIColor.CustomColor.orange.uiColor, for: .normal)
        button.addAction(buttonAction, for: .touchUpInside)
        return button
    }()
    private lazy var stackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addArrangedSubview(titleLabel)
        view.addArrangedSubview(button)
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
        stackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        stackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
    }
    
    // MARK: - Public funcs
    
    func fill(title: String, buttonTitle: String) {
        self.titleLabel.text = title
        self.button.setTitle(buttonTitle, for: .normal)
    }
    
    // MARK: - Actions
    
    private lazy var buttonAction = UIAction { _ in
        
    }
}
