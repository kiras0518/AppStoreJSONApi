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
    
    func fetchApps(searchTerm: String, completion: @escaping ([Result], Error?) -> ()) {
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, res, error) in
            if let error = error {
                print("Failed to fetch apps:", error)
                completion([], nil)
                return
            }
            guard let data = data else { return }
            
            do {
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                //print(searchResult)
                completion(searchResult.results, nil)
            } catch let josnError{
                print("Failed to decode json:", josnError)
                completion([], nil)
            }
            
            }.resume() // fires off the request
    }
    
    func fetchGames(completion: @escaping (AppGroup?, Error?) -> ()) {
        guard let url = URL(string: "https://rss.itunes.apple.com/api/v1/us/apple-music/coming-soon/all/50/explicit.json") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, res, error) in
            
            if let error = error {
                print("Failed to fetch apps:", error)
                completion(nil, error)
                return
            }
            
            //guard let data = data else { return }
            
            do {
                let appGroup = try JSONDecoder().decode(AppGroup.self, from: data!)
                
                completion(appGroup, nil)
            } catch let jsonError {
                completion(nil, error)
                print("Failed to decode json:", jsonError)
            }
            
            
            
            }.resume()
    }
    
}
