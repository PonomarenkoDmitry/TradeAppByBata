//
//  LikeCoordinator.swift
//  TradeAppByBata
//
//  Created by Дмитрий Пономаренко on 19.03.23.
//

import UIKit

class LikeCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    
    var children: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    var storyboard = UIStoryboard(name: "Main", bundle: .main)
    
    func start() {
        print("LikeCoordinator Start")
    
        let likeVC = storyboard.instantiateViewController(withIdentifier: "LikeViewController") as! LikeViewController
        
        likeVC.viewModel = LikeViewModel(nav: self)
        navigationController.pushViewController(likeVC, animated: true)
    }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    deinit {
        print("Deinit like coordinator")
    }
    
}

extension LikeCoordinator: LikeNavigator {
    func goTo() {
        
    }
    
    
}
