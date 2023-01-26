//
//  CartTableViewCell.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 23.01.2023.
//

import UIKit

protocol CartTableViewCellDelegate: AnyObject {
    func cartTableViewCell(_ cell: UITableViewCell, didSelectProduct count: Int)
    func cartTableViewCellDidTapRemoveButton(_ cell: UITableViewCell)
}

class CartTableViewCell: UITableViewCell {

    // MARK:  Private properties
    
    private lazy var image = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var titleLabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: .markProBold, size: 20)
        label.textColor = .white
        return label
    }()
    private lazy var priceLabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: .markPro, size: 17)
        label.textColor = UIColor(.orange)
        return label
    }()
    private lazy var stepper = {
        let stepper = VerticalStepper(style: .minuseOnTop, frame: .zero)
        stepper.translatesAutoresizingMaskIntoConstraints = false
        stepper.itemsColor = .white
        stepper.backgroundColor = .darkGray
        stepper.minimumValue = 1
        stepper.maximumValue = 5
        stepper.value = 1
        stepper.delegate = self
        return stepper
    }()
    private lazy var removeButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "trash"), for: .normal)
        button.tintColor = .darkGray
        button.addAction(removeButtonAction, for: .touchUpInside)
        return button
    }()
    
    // MARK: - PUblic properties
    
    weak var delegate: CartTableViewCellDelegate?
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        selectionStyle = .none
        contentView.addSubview(image)
        contentView.addSubview(titleLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(stepper)
        contentView.addSubview(removeButton)
        activateConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Actions
    
    private lazy var removeButtonAction = UIAction { action in
        self.delegate?.cartTableViewCellDidTapRemoveButton(self)
    }
    
    // MARK: - Private funcs
    
    private func activateConstraints() {
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: topAnchor),
            image.leftAnchor.constraint(equalTo: leftAnchor),
            image.bottomAnchor.constraint(equalTo: bottomAnchor),
            image.widthAnchor.constraint(equalToConstant: 100),
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leftAnchor.constraint(equalTo: image.rightAnchor),
            
            priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            priceLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            priceLabel.leftAnchor.constraint(equalTo: image.rightAnchor),
            
            stepper.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            stepper.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            stepper.leftAnchor.constraint(equalTo: titleLabel.rightAnchor),
            stepper.widthAnchor.constraint(equalToConstant: 25),
            
            removeButton.centerYAnchor.constraint(equalTo: stepper.centerYAnchor),
            removeButton.leftAnchor.constraint(equalTo: stepper.rightAnchor, constant: 10),
            removeButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -5),
            removeButton.widthAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    // MARK: - Public funcs
    
    func fill(_ product: CartProduct?) {
        guard let product = product else { return }
        titleLabel.text = product.title
        priceLabel.text = String(product.price)
    }
}

// MARK: - VerticalStepperDelegate

extension CartTableViewCell: VerticalStepperDelegate {
    func verticalStepper(_ stepper: UIView, didChange value: Double) {
        delegate?.cartTableViewCell(self, didSelectProduct: Int(value))
    }
}
