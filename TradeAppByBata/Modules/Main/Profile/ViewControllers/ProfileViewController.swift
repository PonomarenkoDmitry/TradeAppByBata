//
//  ProfileViewController.swift
//  TradeAppByBata
//
//  Created by Дмитрий Пономаренко on 18.03.23.
//

import UIKit

class ProfileViewController: UIViewController {
    
    
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var balanceLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    
    var viewModel: ProfileViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Profile"
        
        
    }
    
    @IBAction func changePhotoButtonPressed(_ sender: Any) {
    }
    
    
    @IBAction func uploadItemButtonPressed(_ sender: Any) {
        
    }
    
    @IBAction func tradeStoreButtonPressed(_ sender: Any) {
        
    }
    
    
    @IBAction func paymentMethodButtonPressed(_ sender: Any) {
        
    }
    
    @IBAction func balanseButtonPressed(_ sender: Any) {
        
    }
    
    @IBAction func tradeHistoryButtonPressed(_ sender: Any) {
        
    }
    
    @IBAction func restorePurchaseButtonPressed(_ sender: Any) {
        
    }
 
    @IBAction func helpButtonPressed(_ sender: Any) {
 
    }
    
    @IBAction func logOutButtonPressed(_ sender: Any) {
        viewModel.goToLogOut()
    }
    
}
