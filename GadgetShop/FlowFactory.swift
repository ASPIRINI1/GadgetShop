//
//  FlowFactory.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 05.12.2022.
//

import UIKit

protocol MainFlowFactoryProtocol {
    func makeProductList(_ coordinator: CoordinatorProtocol) -> UIViewController
    func makeCart(_ coordinator: CoordinatorProtocol) -> UIViewController
    func makeDetail(_ coordinator: CoordinatorProtocol) -> UIViewController
}

final class MainFlowFactory: MainFlowFactoryProtocol {
    
    let netwokrService = NetwokrService.shared
    
    func makeProductList(_ coordinator: CoordinatorProtocol) -> UIViewController {
        return MainViewController()
    }
    
    func makeCart(_ coordinator: CoordinatorProtocol) -> UIViewController {
        return UIViewController()
    }
    
    func makeDetail(_ coordinator: CoordinatorProtocol) -> UIViewController {
        return UIViewController()
    }
}
