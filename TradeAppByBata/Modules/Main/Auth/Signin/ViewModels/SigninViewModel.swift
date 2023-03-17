//
//  signinViewModel.swift
//  TradeAppByBata
//
//  Created by Дмитрий Пономаренко on 18.03.23.
//

import UIKit
import CoreData


protocol SigninNavigator: AnyObject {
    func goToLogin()
    func goToHome()
}

class SigninViewModel {
 
    weak var navigator: SigninNavigator!
    
    init(nav: SigninNavigator) {
        self.navigator = nav
    }
    
    var firstName = String()
    var lastName = String()
    var email = String()
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    
    var firstNameArray = [String]()
    var lastNameArray = [String]()
    var emailArray = [String]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    //MARK: - Navigator methods
    
    func goToLogin() {
        navigator.goToLogin()
    }
 
    func goToHome() {
        saveData()
        navigator.goToHome()
    }
    //MARK: - Data Manipulation Methods
  
    func saveData() {

        let newUser = Users(context: context)

        newUser.setValue(firstName, forKey: "firstName")
        newUser.setValue(lastName, forKey: "lastName")
        newUser.setValue(email, forKey: "email")

        do {
            try context.save()
        } catch {
            print("Error")
        }

    }
    
    func loadData() {
        let request: NSFetchRequest<Users> = Users.fetchRequest()
        request.returnsObjectsAsFaults = false
        
        do {
            let results = try context.fetch(request)
            
            for result in results as [NSManagedObject] {
                if results.count > 0 {
                    if let firstNameFetch = result.value(forKey: "firstName") as? String {
                        firstNameArray.append(firstNameFetch)
                    }
                    if let lastNameFetch = result.value(forKey: "lastName") as? String {
                        lastNameArray.append(lastNameFetch)
                    }
                    if let emailFetch = result.value(forKey: "email") as? String {
                        emailArray.append(emailFetch)
                    }
                }
            }
        } catch {
            print("Error")
        }
        
    }
    
    //MARK: - Alert Methods
    func warningEr() -> String {
        
        var message = ""
        
        if firstName.isEmpty {
            message = "No first name"
        } else if lastName.isEmpty {
           message = "No last name"
        } else if email.isEmpty {
            message = "No email"
        } else if email.range(of: emailRegEx, options: .regularExpression) == nil {
            message = "No vailid email"
        } else if firstNameArray.contains(firstName) || lastNameArray.contains(lastName) || emailArray.contains(email)  {
            message = "Account Exists"
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
