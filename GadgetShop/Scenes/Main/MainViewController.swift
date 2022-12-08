//
//  MainViewController.swift
//  GadgetShop
//
//  Created by Станислав Зверьков on 05.12.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    private var viewModel: MainViewModelProtocol
    lazy var customView = MainView(frame: .zero)
    
    init(viewModel: MainViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewLoaded()
        viewModel.updateData = { [unowned self] in
            
        }
    }
}
