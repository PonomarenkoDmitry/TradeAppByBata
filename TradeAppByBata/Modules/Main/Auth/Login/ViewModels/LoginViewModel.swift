//
//  LoginViewModel.swift
//  TradeAppByBata
//
//  Created by Дмитрий Пономаренко on 18.03.23.
//

import UIKit
import CoreData

protocol LoginNavigator: AnyObject {
    func goToHome()
    
}

class LoginViewModel {
    
    weak var navigator: LoginNavigator!
    
    init(nav: LoginNavigator) {
        self.navigator = nav
    }
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var firstName = String()
    var password = String()
    var firstNameArray = [String]()
    
    
    func goToHome() {
        navigator.goToHome()
    }
    
    deinit {
        print("Deinit login")
    }
    
    func loadData() {
        let request: NSFetchRequest<Users> = Users.fetchRequest()
        request.returnsObjectsAsFaults = false
        
        do {
            let results = try context.fetch(request)
            
            for result in results as [NSManagedObject] {
                if results.count > 0 {
                    if let firstNamefetch = result.value(forKey: "firstName") as? String {
                        firstNameArray.append(firstNamefetch)
                    }
                }
            }
        } catch {
            print("Error")
        }
        
    }
    
    func warningEr() -> String {
        
        var message = ""
        
        if firstName.isEmpty {
            message = "No first name"
//        } else if password.isEmpty {
//           message = "No password"
        } else if firstNameArray.contains(firstName) != true {
            message = "Account Not Exists"
        } else {
            message = ""
        }
        return message
    }
    
    func showAlert() -> (UIAlertController) {

        lazy var alert = UIAlertController(title: "Warning", message: warningEr(), preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel)
        alert.addAction(action)
        return alert
    }
}
