//
//  VerticalStepper.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 23.01.2023.
//

import UIKit

class VerticalStepper: UIView {
    
    // MARK: Private properties
    
    private lazy var incrementButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.addAction(incrementAction, for: .touchUpInside)
        button.tintColor = itemsColor
        return button
    }()
    private lazy var decrementButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "minus"), for: .normal)
        button.addAction(decrementAction, for: .touchUpInside)
        button.tintColor = itemsColor
        return button
    }()
    private lazy var valueLabel = {
        let label = UILabel()
        label.font = UIFont(name: .markPro, size: 14)
        label.tintColor = itemsColor
        return label
    }()
    private lazy var stackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.alignment = .center
        view.distribution = .fillEqually
        view.backgroundColor = .systemGray6
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        return view
    }()
    
    // MARK: - Public properties
    
    lazy var value: Double = minimumValue {
        didSet {
            if value.truncatingRemainder(dividingBy: 1) == 0 {
                valueLabel.text = String(format: "%.0f", value)
            } else {
                valueLabel.text = String(format: "%.1f", value)
            }
        }
    }
    var minimumValue: Double = 0
    var maximumValue: Double = 100
    var stepValue: Double = 1
    var itemsColor = UIColor.black
    
    enum VerticalStepperStyle {
        case plusOnTop, minuseOnTop
    }
    
    // MARK: - Init
    
    init(style: VerticalStepperStyle, frame: CGRect) {
        super.init(frame: frame)
        switch style {
        case .plusOnTop:
            stackView.addArrangedSubview(incrementButton)
            stackView.addArrangedSubview(valueLabel)
            stackView.addArrangedSubview(decrementButton)
        case .minuseOnTop:
            stackView.addArrangedSubview(decrementButton)
            stackView.addArrangedSubview(valueLabel)
            stackView.addArrangedSubview(incrementButton)
        }
        addSubview(stackView)
        activateConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Actions
    
    private lazy var incrementAction = UIAction { action in
        guard self.value + self.stepValue <= self.maximumValue else { return }
        self.value += self.stepValue
    }
    
    private lazy var decrementAction = UIAction { action in
        guard self.value - self.stepValue >= self.minimumValue else { return }
        self.value -= self.stepValue
    }
    
    // MARK: - Private funcs
    
    private func activateConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leftAnchor.constraint(equalTo: leftAnchor),
            stackView.rightAnchor.constraint(equalTo: rightAnchor)
        ])
    }
}
