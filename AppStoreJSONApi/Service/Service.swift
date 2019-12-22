//
//  Service.swift
//  AppStoreJSONApi
//
//  Created by kiras on 2019/11/28.
//  Copyright © 2019 ameyo. All rights reserved.
//

import Foundation

class Service {
    
    static let shared = Service()
    
    func fetchApps(searchTerm: String, completion: @escaping (SearchResult?, Error?) -> ()) {
        
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
        
        fetchGenericJSONData(urlString: urlString, completion: completion)
        
    }
    
    func fetchTopGrossing(completion: @escaping (AppGroup?, Error?) -> ()) {
        
        let url = "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-grossing/all/50/explicit.json"
        
        fetchAppGroup(urlString: url, completion: completion)
    }
    
    func fetchGames(completion: @escaping (AppGroup?, Error?) -> ()) {
        
        let url = "https://rss.itunes.apple.com/api/v1/us/ios-apps/new-games-we-love/all/50/explicit.json"
        
        
        fetchAppGroup(urlString: url, completion: completion)
    }
    
    //helper
    func fetchAppGroup(urlString: String, completion: @escaping (AppGroup?, Error?) -> Void) {
        
        fetchGenericJSONData(urlString: urlString, completion: completion)
        
    }
    
    func fetchSocialApps(completion: @escaping ([SocialApp]?, Error?) -> Void) {
        
        let urlString = "https://api.letsbuildthatapp.com/appstore/social"
        
        fetchGenericJSONData(urlString: urlString, completion: completion)
        
    }
    
    // declare my generic json function here
    func fetchGenericJSONData<T: Decodable>(urlString: String, completion: @escaping (T?, Error?)-> ()) {
        
        //print("T is Tyep", T.self)
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, res, error) in
            
            if let error = error {
                print("Failed to fetch apps:", error)
                completion(nil, error)
                return
            }
            
            do {
                let object = try JSONDecoder().decode(T.self, from: data!)
                
                completion(object, nil)
            } catch let jsonError {
                completion(nil, error)
                print("Failed to decode json:", jsonError)
            }
            
            }.resume()
        
    }
    
}

//class Stack<T: Decodable> {
//    var items = [T]()
//    func push(item: T) { items.append(item) }
//    func pop() -> T? { return items.last }
//}
//
//func dummyFunc() {
//
//    let stackOfStrings = Stack<String>()
//    stackOfStrings.push(item: "This is to ba string")
//
//    let stackOfInts = Stack<Int>()
//    stackOfInts.push(item: 1)
//
//}
//
