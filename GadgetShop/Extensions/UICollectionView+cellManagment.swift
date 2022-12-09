//
//  UICollectionView+cellManagment.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 09.12.2022.
//

import UIKit

extension UICollectionView {
    func dequeue<T: UICollectionViewCell>(_ cellClass: T.Type, _ indexParh: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: cellClass.identefier, for: indexParh) as? T else {
            fatalError()
        }
        return cell
    }

    func register<T: UICollectionViewCell>(_ cellClass: T.Type) {
        register(cellClass, forCellWithReuseIdentifier: cellClass.identefier)
    }
}
