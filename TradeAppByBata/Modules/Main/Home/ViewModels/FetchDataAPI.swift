//
//  FetchDataAPI.swift
//  TradeAppByBata
//
//  Created by Дмитрий Пономаренко on 25.03.23.
//

import UIKit


class FetchLatestAPI {
    
    static let shared = FetchLatestAPI()
    
    //    func fetcLatest(comletion: @escaping(Result<[Latest],Error>) -> Void) {
    //
    //        guard let url = URL(string: "https://run.mocky.io/v3/cc0071a1-f06e-48fa-9e90-b1c2a61eaca7") else {
    //            comletion(.failure(NSError(domain: "InvalidURL", code: 0)))
    //            return
    //        }
    //
    //        let task = URLSession.shared.dataTask(with: url) { data, response, error in
    //            guard let jsonData = data else {
    //                comletion(.failure(error ?? NSError(domain: "No data", code: 0)))
    //                return
    //            }
    //
    //            do {
    //                let latestList = try JSONDecoder().decode(LatestList.self, from: jsonData)
    //                comletion(.success(latestList.latest))
    //                print(latestList.latest)
    //            } catch {
    //                comletion(.failure(error))
    //            }
    //        }
    //        task.resume()
    //    }
    //}
    
    func fetcLatest(comletion: @escaping([Latest]) -> Void) {
        
        guard let url = URL(string: "https://run.mocky.io/v3/cc0071a1-f06e-48fa-9e90-b1c2a61eaca7") else {
            //            comletion(.failure(NSError(domain: "InvalidURL", code: 0)))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let jsonData = data else {
                //                comletion(.failure(error ?? NSError(domain: "No data", code: 0)))
                print("No Data")
                return
            }
            
            do {
                let latestList = try JSONDecoder().decode(LatestList.self, from: jsonData)
                //                comletion(.success(latestList.latest))
//                print(latestList)
                comletion(latestList.latest)
            } catch {
                //                comletion(.failure(error))
                print(error)
            }
            
        }
        task.resume()
    }
}
