//
//  MusicController.swift
//  AppStoreJSONApi
//
//  Created by kiras on 2020/3/27.
//  Copyright © 2020 ameyo. All rights reserved.
//

import UIKit

class MusicController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    fileprivate let cellId = "cellId"
    fileprivate let footerId = "footerId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        
        collectionView.register(TrackCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(MusicLoadingFooter.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: footerId)
        
        fetchData()
    }
    
    var results = [Result]()
    var searchTerm = "taylor"
    
    fileprivate func fetchData() {
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&offset=0&limit=20"
        
        Service.shared.fetchGenericJSONData(urlString: urlString) { (searchResult: SearchResult?, err) in
            
            if let error = err {
                print("Failed to paginate data:", error)
                return
            }
            
            self.results = searchResult?.results ?? []
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
            
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: footerId, for: indexPath)
        
        return footer
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        let height: CGFloat = isDonePagination ? 0 : 100
        return .init(width: view.frame.width, height: height)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return results.count
    }
    
    var isPagination = false
    var isDonePagination = false
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! TrackCell
        
        let track = results[indexPath.row]
        
        cell.nameLabel.text = track.trackName
        cell.imageView.sd_setImage(with: URL(string: track.artworkUrl100))
        cell.subLabel.text = "\(track.trackName ?? "" ) * \(track.collectionName ?? "")"
        
        if indexPath.row == results.count - 1 {
            print("fetch more data")
            
            isPagination = true
            
            let urlString = "https://itunes.apple.com/search?term=\(results.count)&offset=0&limit=20"
            
            Service.shared.fetchGenericJSONData(urlString: urlString) { (searchResult: SearchResult?, err) in
                
                if let error = err {
                    print("Failed to paginate data:", error)
                    return
                }
                
                if searchResult?.results.count == 0 {
                    self.isDonePagination = true
                }
                
                sleep(2)
                
                self.results += searchResult?.results ?? []
                
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
                self.isPagination = false
            }
            
        }
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 100)
    }
}
