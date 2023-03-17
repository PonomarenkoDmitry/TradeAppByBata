//
//  HomeViewModel.swift
//  TradeAppByBata
//
//  Created by Дмитрий Пономаренко on 18.03.23.
//

import UIKit


protocol HomeNavigator: AnyObject {
    func goTo()
}

class HomeViewModel {
    
    weak var navigator: HomeNavigator!
    var latest: [Latest] = []
    var sale: [Sale] = []
    
    
    init(nav: HomeNavigator!) {
        self.navigator = nav
        
    }
}


extension HomeViewModel: HomeNavigator {
    
    func goTo() {
        
    }
    
}

