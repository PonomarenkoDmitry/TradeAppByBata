//
//  ChatViewModel.swift
//  TradeAppByBata
//
//  Created by Дмитрий Пономаренко on 19.03.23.
//


import UIKit

protocol ChatNavigator: AnyObject {
    func goTo()
}

class ChatViewModel {
    
    weak var navigator: ChatNavigator!
    
    init(nav: ChatNavigator!) {
        self.navigator = nav
    }
    
}
