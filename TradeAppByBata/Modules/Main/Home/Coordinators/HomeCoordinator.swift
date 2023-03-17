//
//  HomeCoordinator.swift
//  TradeAppByBata
//
//  Created by Дмитрий Пономаренко on 18.03.23.
//

import UIKit

class HomeCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    
    var children: [Coordinator] = []
    var latest: [Latest] = []
    var sale: [Sale] = []
    var navigationController: UINavigationController
    
    
    var storyboard = UIStoryboard(name: "Main", bundle: .main)

    func start() {
        
        print("HomeCoordinator Start")
        
        let homeVC = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        
        homeVC.viewModel = HomeViewModel(nav: self)
        homeVC.navigationItem.title = "Trade by bata"
       
        let leftTabButton = UIBarButtonItem()
        leftTabButton.image = UIImage(named: "leftItem.png")
        leftTabButton.tintColor = .black
        homeVC.navigationItem.leftBarButtonItem = leftTabButton
        

        homeVC.viewModel.latest = latest
        homeVC.viewModel.sale = sale
        navigationController.pushViewController(homeVC, animated: true)
        
    }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    
    deinit {
        print("Deinit home coordinator")
    }
    
}

extension HomeCoordinator: HomeNavigator {
    func goTo() {
        
    }
}

