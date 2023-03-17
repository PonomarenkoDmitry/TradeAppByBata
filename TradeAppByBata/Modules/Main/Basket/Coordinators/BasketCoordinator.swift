//
//  BasketCoordinator.swift
//  TradeAppByBata
//
//  Created by Дмитрий Пономаренко on 19.03.23.
//

import UIKit

class BasketCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    
    var children: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    var storyboard = UIStoryboard(name: "Main", bundle: .main)
    
    func start() {
        print("BasketCoordinator Start")
    
        let basketVC = storyboard.instantiateViewController(withIdentifier: "BasketViewController") as! BasketViewController
        
        basketVC.viewModel = BasketViewModel(nav: self)
        navigationController.pushViewController(basketVC, animated: true)
    }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    deinit {
        print("Deinit basket coordinator")
    }
    
}

extension BasketCoordinator: BasketNavigator {
    func goTo() {
        
    }
    
    
}
