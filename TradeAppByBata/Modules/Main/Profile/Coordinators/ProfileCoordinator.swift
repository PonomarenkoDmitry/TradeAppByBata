//
//  ProfileCoordinator.swift
//  TradeAppByBata
//
//  Created by Дмитрий Пономаренко on 18.03.23.
//

import UIKit

class ProfileCoordinator: Coordinator {
    
    var parentCoordinator: Coordinator?
    
    var children: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    let storyboard = UIStoryboard(name: "Main", bundle: .main)
    
    func start() {
        print("ProfileCoordinator Start")

        let profileVC = storyboard.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        profileVC.viewModel = ProfileViewModel(nav: self)
        navigationController.pushViewController(profileVC, animated: true)
       
        
    }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    deinit {
        print("Deinit profile coordinator")
    }
}

extension ProfileCoordinator: ProfileNavigation {
   
    func goToTradeStore() {
        
    }
    
    func goToPaymentMethod() {
        
    }
    
    func goToBalance() {
        
    }
    
    func goToTradeHistory() {
        
    }
    
    func goToRestoreHistory() {
        
    }
    
    func goToHelp() {
        
    }
    
    func logOut() {
        let appC = parentCoordinator as! AppCoordinator
        appC.goToAuth()
        appC.childrenDidFinish(self)
        
    }
}
