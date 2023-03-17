//
//  AppDelegate.swift
//  TradeAppByBata
//
//  Created by Дмитрий Пономаренко on 18.03.23.
//

import UIKit
import CoreData

 @main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
    
        let navigationCon = UINavigationController()
        appCoordinator = AppCoordinator(navigationController: navigationCon)
        
        fetcLatest { (fetchedLatestList: [Latest]) in
            self.appCoordinator?.latest = fetchedLatestList
        }
        fetcSale { (fetchedSaleList: [Sale]) in
            self.appCoordinator?.sale = fetchedSaleList
        }
        
        appCoordinator?.start()
        
        
        window?.rootViewController = navigationCon
        window?.makeKeyAndVisible()
    
        
        return true
    }

    
    func fetcLatest(comletion: @escaping([Latest]) -> Void) {
        
        guard let url = URL(string: "https://run.mocky.io/v3/cc0071a1-f06e-48fa-9e90-b1c2a61eaca7") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let jsonData = data else {
                print("No Data")
                return
            }
            
            do {
                let latestList = try JSONDecoder().decode(LatestList.self, from: jsonData)
                comletion(latestList.latest)
            } catch {
                print(error)
            }
           
        }
        task.resume()
    }
    
    func fetcSale(comletion: @escaping([Sale]) -> Void) {
        
        guard let url = URL(string: "https://run.mocky.io/v3/a9ceeb6e-416d-4352-bde6-2203416576ac") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let jsonData = data else {
                print("No Data")
                return
            }
            
            do {
                let saleList = try JSONDecoder().decode(SaleList.self, from: jsonData)
                comletion(saleList.flash_sale)
            } catch {
                print(error)
            }
           
        }
        task.resume()
    }
    
    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "TradeAppByBata")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

