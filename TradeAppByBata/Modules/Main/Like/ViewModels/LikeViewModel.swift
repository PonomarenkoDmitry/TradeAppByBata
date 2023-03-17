//
//  LikeViewModel.swift
//  TradeAppByBata
//
//  Created by Дмитрий Пономаренко on 19.03.23.
//

import UIKit

protocol LikeNavigator: AnyObject {
    func goTo()
}

class LikeViewModel {
    
    weak var navigator: LikeNavigator!
    
    init(nav: LikeNavigator!) {
        self.navigator = nav
    }
    
}
