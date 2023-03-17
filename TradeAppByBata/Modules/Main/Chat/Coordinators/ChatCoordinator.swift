//
//  ChatCoordinator.swift
//  TradeAppByBata
//
//  Created by Дмитрий Пономаренко on 19.03.23.
//

import UIKit

class ChatCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    
    var children: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    var storyboard = UIStoryboard(name: "Main", bundle: .main)
    
    func start() {
        print("ChatCoordinator Start")
    
        let chatVC = storyboard.instantiateViewController(withIdentifier: "ChatViewController") as! ChatViewController
        
        chatVC.viewModel = ChatViewModel(nav: self)
        navigationController.pushViewController(chatVC, animated: true)
    }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    deinit {
        print("Deinit chat coordinator")
    }
    
}

extension ChatCoordinator: ChatNavigator {
    func goTo() {
        
    }
    
    
}
