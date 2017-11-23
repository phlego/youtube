//
//  ApiService.swift
//  youtube
//
//  Created by Lewis Le on 22/11/2017.
//  Copyright © 2017 Lewis Le. All rights reserved.
//

import UIKit

class ApiService: NSObject {
    static let instance = ApiService()
    
    let baseUrl = "https://s3-us-west-2.amazonaws.com/youtubeassets"
    
    func fetchVideos(_ completion: @escaping ([Video]) -> ()) {
        fetchFeed(forUrlString: "\(baseUrl)/home.json", completion)
    }
    
    func fetchTrendingFeed(_ completion: @escaping ([Video]) -> ()) {
        fetchFeed(forUrlString: "\(baseUrl)/trending.json", completion)
    }
    
    func fetchSubscriptionFeed(_ completion: @escaping ([Video]) -> ()) {
        fetchFeed(forUrlString: "\(baseUrl)/subscriptions.json", completion)
    }
    
    func fetchFeed(forUrlString urlString: String, _ completion: @escaping ([Video]) -> ()) {
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                print(error!)
                return
            }
            
            do {
                if let unwrappedData = data, let jsonDictionaries = try JSONSerialization.jsonObject(with: unwrappedData, options: .mutableContainers) as? [[String: Any]] {
                    DispatchQueue.main.async {
                        completion(jsonDictionaries.map({ return Video(dictionary: $0) }))
                    }
                }
            } catch let jsonError {
                print(jsonError)
            }
            
        }.resume()
    }
}

