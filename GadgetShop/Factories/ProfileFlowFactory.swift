//
//  ProfileFlowFactory.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 15.01.2023.
//

import UIKit

protocol ProfileFlowFactoryProtocol {
    func makeProfile(_ coordinator: ProfileFlowCoordinatorProtocol) -> UIViewController
}

final class ProfileFlowFactory: ProfileFlowFactoryProtocol {
    func makeProfile(_ coordinator: ProfileFlowCoordinatorProtocol) -> UIViewController {
        let vc = UIViewController()
        vc.tabBarItem.image = UIImage(systemName: "person")
        vc.tabBarItem.selectedImage = UIImage(systemName: "person.fill")
        vc.tabBarItem.title = "Profile"
        return vc
    }
}
