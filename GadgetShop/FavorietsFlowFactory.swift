//
//  FavorietsFlowFactory.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 15.01.2023.
//

import UIKit

protocol FavorietsFlowFactoryProtocol {
    func makeFavoriets(_ coordinator: FavorietsFlowCoorditanorProtocol) -> UIViewController
}

class FavorietsFlowFactory: FavorietsFlowFactoryProtocol {
    func makeFavoriets(_ coordinator: FavorietsFlowCoorditanorProtocol) -> UIViewController {
        let vc = UIViewController()
        vc.tabBarItem.image = UIImage(systemName: "heart")
        vc.tabBarItem.selectedImage = UIImage(systemName: "heart.fill")
        vc.tabBarItem.title = "Favoriets"
        return vc
    }
}
