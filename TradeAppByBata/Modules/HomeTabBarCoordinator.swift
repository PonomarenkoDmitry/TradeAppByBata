//
//  HomeTabBarCoordinator.swift
//  TradeAppByBata
//
//  Created by Дмитрий Пономаренко on 18.03.23.
//

import UIKit


class HomeTabBarCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    
    var children: [Coordinator] = []
    var latest: [Latest] = []
    var sale: [Sale] = []
    private let imageView = UIImageView(image: UIImage(named: "Photo"))
    var navigationController: UINavigationController
    
    func start() {
        print("HomeTabbar Coordinator Init")
        initializeHomeTabBar()
    }
    
    
    deinit {
        print("HomeTabbar Coordinator Deinit")
    }
    
    let storyboard = UIStoryboard.init(name: "Main", bundle: .main)
    
    func initializeHomeTabBar() {
        let viewController = UITabBarController()
        
        viewController.tabBar.backgroundColor = .white
        viewController.tabBar.layer.cornerRadius = 20
        viewController.tabBar.layer.masksToBounds = true
        
        let homeNavigationController = UINavigationController()
       
        let homeCoordinator = HomeCoordinator(navigationController: homeNavigationController)
        
        homeNavigationController.navigationBar.addSubview(imageView)
        imageView.layer.cornerRadius = Const.ImageSizeForLargeState / 2
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.rightAnchor.constraint(equalTo: homeNavigationController.navigationBar.rightAnchor,
                                             constant: -Const.ImageRightMargin),
            imageView.bottomAnchor.constraint(equalTo: homeNavigationController.navigationBar.bottomAnchor,
                                              constant: -Const.ImageBottomMarginForLargeState),
            imageView.heightAnchor.constraint(equalToConstant: Const.ImageSizeForLargeState),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor)
            ])

        
        homeCoordinator.parentCoordinator = parentCoordinator
        
        let homeItem = UITabBarItem()
        homeItem.image = UIImage(named: "home.png")
        homeNavigationController.tabBarItem = homeItem
        
        let likeNavigationController = UINavigationController()
        let likeCoordinator = LikeCoordinator(navigationController: likeNavigationController)
        homeCoordinator.parentCoordinator = parentCoordinator
        
        let likeItem = UITabBarItem()
        likeItem.image = UIImage(named: "heart.png")
        likeNavigationController.tabBarItem = likeItem
        
        
        let basketNavigationController = UINavigationController()
        let basketCoordinator = BasketCoordinator(navigationController: basketNavigationController)
        basketCoordinator.parentCoordinator = parentCoordinator
        
        let basketItem = UITabBarItem()
        basketItem.image = UIImage(named: "basket.png")
        basketNavigationController.tabBarItem = basketItem
        
        let chatNavigationController = UINavigationController()
        let chatCoordinator = ChatCoordinator(navigationController: chatNavigationController)
        chatCoordinator.parentCoordinator = parentCoordinator
        
        let chatItem = UITabBarItem()
        chatItem.image = UIImage(named: "chat.png")
        
        chatNavigationController.tabBarItem = chatItem
        
        
        let profileNavigationController = UINavigationController()
        let profileCoordinator = ProfileCoordinator.init(navigationController: profileNavigationController)
        profileCoordinator.parentCoordinator = parentCoordinator
        
        
        let profileItem = UITabBarItem()
        profileItem.image = UIImage(named: "profile.png")
        profileNavigationController.tabBarItem = profileItem
        viewController.viewControllers = [homeNavigationController, likeNavigationController, basketNavigationController, chatNavigationController, profileNavigationController]
        
        navigationController.pushViewController(viewController, animated: false)
        navigationController.setNavigationBarHidden(true, animated: true)
        
        parentCoordinator?.children.append(homeCoordinator)
        parentCoordinator?.children.append(likeCoordinator)
        parentCoordinator?.children.append(basketCoordinator)
        parentCoordinator?.children.append(chatCoordinator)
        parentCoordinator?.children.append(profileCoordinator)
        
        homeCoordinator.latest = self.latest
        homeCoordinator.sale = self.sale
        homeCoordinator.start()
        likeCoordinator.start()
        basketCoordinator.start()
        chatCoordinator.start()
        profileCoordinator.start()
    }
    init (navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}



