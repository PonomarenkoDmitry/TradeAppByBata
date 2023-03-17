//
//  ProfileViewModel.swift
//  TradeAppByBata
//
//  Created by Дмитрий Пономаренко on 18.03.23.
//

import UIKit

protocol ProfileNavigation: AnyObject {
    func goToTradeStore()
    func goToPaymentMethod()
    func goToBalance()
    func goToTradeHistory()
    func goToRestoreHistory()
    func goToHelp()
    func logOut()
}

class ProfileViewModel {
    
    weak var navigation: ProfileNavigation!
    
    init(nav: ProfileNavigation!) {
        self.navigation = nav
    }
    
    func goToLogOut() {
        navigation.logOut()
    }
    
    
}
