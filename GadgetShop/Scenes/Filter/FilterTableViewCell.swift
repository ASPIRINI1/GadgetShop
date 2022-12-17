//
//  FilterTableViewCell.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 15.12.2022.
//

import UIKit

protocol FilterTableViewCellDelegate: AnyObject {
    func filterTableViewCell(_ cell: FilterTableViewCell, didSelectFilterOptionsWith lhs: Any?, _ rhs: Any?)
}

class FilterTableViewCell: UITableViewCell {
    
    private lazy var titleLabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
//        label.font = UIFont(name: .markProMedium, size: 17)
        addSubview(label)
        return label
    }()
    private lazy var filterTextField = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.inputView = pickerView
        view.inputAccessoryView = toolBar
        view.borderStyle = .roundedRect
//        view.font = UIFont(name: .markPro, size: 14)
        view.addSubview(textFiledImage)
        addSubview(view)
        return view
    }()
    private lazy var textFiledImage = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(systemName: "chevron.down")
        view.tintColor = .lightGray
        return view
    }()
    private lazy var pickerView = {
        let view = UIPickerView()
        view.dataSource = self
        view.delegate = self
        return view
    }()
    private lazy var toolBar = {
        let view = UIToolbar()
        view.sizeToFit()
        let space = UIBarButtonItem(systemItem: .flexibleSpace)
        let doneButton = UIBarButtonItem(title: "Done",
                                         style: .plain,
                                         target: self,
                                         action: #selector(pickerViewDoneButtonAction))
        view.setItems([space, doneButton], animated: false)
        return view
    }()
    private var textFieldComponents = [Any?]() {
        didSet {
            fillTextField()
            handleEditing()
        }
    }
    
    private var filterData: [Any] = ["-"]
    private var cellStyle = FilterCellStyle.single
    weak var delegate: FilterTableViewCellDelegate?
    
    enum FilterCellStyle: Int {
        case single = 1
        case double = 2
    }


    //  MARK: - Cell setup

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setNeedsUpdateConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func fill(title: String,_ data: [Any], _ cellStyle: FilterCellStyle) {
        titleLabel.text = title
        self.cellStyle = cellStyle
        self.filterData.append(contentsOf: data)
        switch cellStyle {
        case .single:
            textFieldComponents = [filterData.first]
        case .double:
            textFieldComponents = [filterData.first, filterData.first]
        }
    }
    
    private func fillTextField() {
        switch cellStyle {
        case .single:
            filterTextField.text = String(describing: textFieldComponents[0] ?? "-")
        case .double:
            filterTextField.text = String(describing: textFieldComponents[0] ?? "-") + " to " + String(describing: textFieldComponents[1] ?? "-")
        }
    }
    
    private func handleEditing() {
        switch cellStyle {
        case .single:
            delegate?.filterTableViewCell(self, didSelectFilterOptionsWith: textFieldComponents[0], nil)
        case .double:
            delegate?.filterTableViewCell(self, didSelectFilterOptionsWith: textFieldComponents[0], textFieldComponents[1])
        }
    }
    
    //  MARK: - Actions
    
    @objc private func pickerViewDoneButtonAction(_ sender: UIBarButtonItem) {
        endEditing(true)
    }
 
    //  MARK: - Layout

    override func updateConstraints() {
        super.updateConstraints()
        contentView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        filterTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5).isActive = true
        filterTextField.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        filterTextField.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        filterTextField.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        textFiledImage.centerYAnchor.constraint(equalTo: filterTextField.centerYAnchor).isActive = true
        textFiledImage.rightAnchor.constraint(equalTo: filterTextField.rightAnchor, constant: -10).isActive = true
    }
}

//  MARK: - UIPickerViewDataSource

extension FilterTableViewCell: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return cellStyle.rawValue
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return filterData.count
    }
}

//  MARK: - UIPickerViewDelegate

extension FilterTableViewCell: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(describing: filterData[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if row == 0 {
            textFieldComponents[component] = nil
        } else {
            textFieldComponents[component] = filterData[row]
        }
    }
}
