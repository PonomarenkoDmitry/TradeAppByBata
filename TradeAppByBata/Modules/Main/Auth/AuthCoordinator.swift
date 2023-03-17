//
//  AuthCoordinator.swift
//  TradeAppByBata
//
//  Created by Дмитрий Пономаренко on 18.03.23.
//

import UIKit

class AuthCoordinator: Coordinator {
    
    var parentCoordinator: Coordinator?
    
    var children: [Coordinator] = []
    
    var navigationController: UINavigationController

    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }

    func start() {
        goToSignin()
        
    }
    
    let storyboard = UIStoryboard(name: "Main", bundle: .main)
    
    
    deinit {
        print("AuthCoordinator Deinit")
    }
}

extension AuthCoordinator: SigninNavigator, LoginNavigator {
   
    
    func goToLogin() {
        
        let loginVC = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginVIewContoller
        
        let loginViewModel = LoginViewModel(nav: self)
        
        loginVC.viewModel = loginViewModel
        
        
        navigationController.pushViewController(loginVC, animated: true)
        navigationController.isNavigationBarHidden = true
    }
    
    func goToHome() {
        let appC = parentCoordinator as! AppCoordinator
        appC.goToHome()
        parentCoordinator?.childrenDidFinish(self)
    }
    
    func goToSignin() {
        
        let signinVC = storyboard.instantiateViewController(withIdentifier: "SigninViewController") as! SigninViewController
        
        let signinViewModel = SigninViewModel(nav: self)
        
        signinVC.viewModel = signinViewModel
        
        navigationController.pushViewController(signinVC, animated: true)
        
    }
    
    
    
}
