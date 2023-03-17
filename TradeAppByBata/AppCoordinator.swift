//
//  AppCoordinator.swift
//  TradeAppByBata
//
//  Created by Дмитрий Пономаренко on 18.03.23.
//

import UIKit


class AppCoordinator: Coordinator {
   
   
    var parentCoordinator: Coordinator?
    
    var children: [Coordinator] = []
    
    var navigationController: UINavigationController
    var latest: [Latest] = []
    var sale: [Sale] = []
    
    init(navigationController : UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        print("AppCoordinator Start")

        goToAuth()
    }
    
    func goToAuth() {
        let authCoordinator = AuthCoordinator(navigationController: navigationController)
        children.removeAll()
        
        authCoordinator.parentCoordinator = self
        children.append(authCoordinator)
        authCoordinator.start()
        
    }
    
    func goToHome() {
        let homeCoordinator = HomeTabBarCoordinator(navigationController: navigationController)
        children.removeAll()
        homeCoordinator.parentCoordinator = self
        homeCoordinator.latest = self.latest
        homeCoordinator.sale = self.sale

        homeCoordinator.start()
    }
    
    deinit {
        print("AppCoordinator Deinit")
    }
}
