//
//  DetailView.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 20.12.2022.
//

import UIKit

class DetailView: UIView {

    private lazy var headerView = {
        let leftButton = RoundedButton(frame: .box,
                                       image: UIImage(systemName: ""),
                                       title: nil,
                                       color: UIColor.CustomColor.pink.uiColor)
        let rightButton = RoundedButton(frame: .box,
                                        image: UIImage(systemName: ""),
                                        title: nil,
                                        color: UIColor.CustomColor.orange.uiColor)
        let view = HeaderView(leftButton: leftButton, title: "Product Details", rightButton: rightButton)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var imageCollectionView = {
        let view = UICollectionView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
}
