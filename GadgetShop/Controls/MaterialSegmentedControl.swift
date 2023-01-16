//
//  MaterialSegmentedControl.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 15.01.2023.
//

import UIKit

protocol MaterialSegmentedControlDelegate: AnyObject {
    func materialSegmentedControl(_ control: MaterialSegmentedControl, didSelectItemAt index: Int)
}

class MaterialSegmentedControl: UIStackView {
    
    private var selectorViewYPosition = 0
    private var buttons = [UIButton]()
    private var action: UIAction?
    private lazy var selectorView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 0 , height: 3))
        view.backgroundColor = UIColor(.orange)
        return view
    }()
    var selectedSegmetnTintColor: UIColor? {
        get {
            return selectorView.backgroundColor
        }
        set {
            selectorView.backgroundColor = newValue
        }
    }
    var selectedSegmentIndex = 0
    weak var delegate: MaterialSegmentedControlDelegate?
    
    // MARK: - Init
        
    init(frame: CGRect, items: [String]) {
        super.init(frame: frame)
        distribution = .fillEqually
        for (index, item) in items.enumerated() {
            let button = UIButton()
            button.tag = index
            let normalTitle = NSAttributedString(string: item,
                                                 attributes: [.font : UIFont(name: .markPro, size: 17) as Any])
            let selectedTitle = NSAttributedString(string: item,
                                                   attributes: [.font : UIFont(name: .markProBold, size: 17) as Any])
            button.setAttributedTitle(normalTitle, for: .normal)
            button.setAttributedTitle(selectedTitle, for: .selected)
            button.setTitleColor(.black, for: .normal)
            button.addTarget(self, action: #selector(segmentButtonAction), for: .touchUpInside)
            buttons.append(button)
            addArrangedSubview(button)
        }
        addSubview(selectorView)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private funcs
    
    private func setSelected(itemIndex: Int) {
        guard itemIndex < buttons.count else { return }
        let button = buttons[itemIndex]
        button.isSelected = true
        self.buttons[self.selectedSegmentIndex].isSelected = false
        self.selectedSegmentIndex = itemIndex
        let center = CGPoint(x: button.frame.midX, y: button.frame.maxY)
        UIView.animate(withDuration: 0.3) {
            self.selectorView.center = center
        }
    }
    
    // MARK: - Actions
    
    @objc private func segmentButtonAction(_ sender: UIButton) {
        delegate?.materialSegmentedControl(self, didSelectItemAt: sender.tag)
        setSelected(itemIndex: sender.tag)
    }
    
    // MARK: - Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let segmentWidth: CGFloat = subviews.first?.frame.width ?? 1
        selectorView.frame.size.width = segmentWidth * 0.7
        if selectorView.frame.maxY < frame.maxY, selectedSegmentIndex < buttons.count {
            let buttonFrame = buttons[selectedSegmentIndex].frame
            let center = CGPoint(x: buttonFrame.midX, y: buttonFrame.maxY)
            selectorView.center = center
        }
    }
}
