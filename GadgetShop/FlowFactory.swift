//
//  FlowFactory.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 05.12.2022.
//

import UIKit

protocol FlowFactoryProtocol {
    func makeProductList() -> UIViewController
    func makeCart() -> UIViewController
}


final class FlowFactory {
    func makeProductList() -> UIViewController {
        return UIViewController()
    }
    
    func makeCart() -> UIViewController {
        return UIViewController()
    }
}
