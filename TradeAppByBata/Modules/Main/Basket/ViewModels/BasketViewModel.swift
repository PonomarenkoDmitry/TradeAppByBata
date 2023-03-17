//
//  BasketViewModel.swift
//  TradeAppByBata
//
//  Created by Дмитрий Пономаренко on 19.03.23.
//

import UIKit

protocol BasketNavigator: AnyObject {
    func goTo()
}

class BasketViewModel {
    
    weak var navigator: BasketNavigator!
    
    init(nav: BasketNavigator!) {
        self.navigator = nav
    }
    
}
