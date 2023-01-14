//
//  UICollectionView+cellManagment.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 09.12.2022.
//

import UIKit

//  MARK: - ReuseCell

extension UICollectionView {
    func register<T: UICollectionViewCell>(_ cellClass: T.Type) {
        register(cellClass, forCellWithReuseIdentifier: cellClass.identefier)
    }
    
    func dequeue<T: UICollectionViewCell>(_ cellClass: T.Type, _ indexParh: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: cellClass.identefier, for: indexParh) as? T else {
            fatalError()
        }
        return cell
    }
}

//  MARK: - ReuseView

extension UICollectionView {
    enum ReuseViewKind {
        case header
        case footer
        
        var stringValue: String {
            switch self {
            case .header:
                return UICollectionView.elementKindSectionHeader
            case .footer:
                return UICollectionView.elementKindSectionFooter
            }
        }
    }
    
    func register<T: UICollectionReusableView>(_ viewClass: T.Type, forSupplementaryViewOfKind kind: ReuseViewKind) {
        register(viewClass, forSupplementaryViewOfKind: kind.stringValue, withReuseIdentifier: String(describing: viewClass))
    }
    
    func dequeue<T: UICollectionReusableView>(_ viewClass: T.Type, ofKind: ReuseViewKind, indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableSupplementaryView(ofKind: ofKind.stringValue,
                                                          withReuseIdentifier: String(describing: viewClass),
                                                          for: indexPath) as? T else { fatalError() }
        return cell
    }
}
