//
//  AppDetailController.swift
//  AppStoreJSONApi
//
//  Created by kiras on 2019/12/8.
//  Copyright © 2019 ameyo. All rights reserved.
//

import UIKit

class AppDetailController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    let detailCellId = "detailCellId"
    let previewCellId = "previewCellId"
    let reviewCellId = "reviewCellId"
   
    var app: Result?
    var reviews: Reviews?
    
    var appId: String? {
        didSet {
            print("Here is my appID", appId)
            let url = "https://itunes.apple.com/lookup?id=\(appId ?? "")"
            Service.shared.fetchGenericJSONData(urlString: url) { (result: SearchResult?, err) in
                //print(result?.results.first?.releaseNotes)
                let app = result?.results.first
                self.app = app
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
            
            let reviewsUrl = "https://itunes.apple.com/rss/customerreviews/page=1/id=\(appId ?? "")/sortby=mostrecent/json?l=en&cc=us"
            Service.shared.fetchGenericJSONData(urlString: reviewsUrl) { (reviews: Reviews?, err) in
                if let err = err {
                    print("Failed to decode revies:", err)
                    return
                }
                
                self.reviews = reviews
                
                reviews?.feed.entry.forEach({print($0.rating.label)})
                
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
                
//                reviews?.feed.entry.forEach({ (entry) in
//                    print(entry.title, entry.content)
//                })
            }
        }
    }
    
    override func viewDidLoad() {
        collectionView.backgroundColor = .white
        
        collectionView.register(AppDetailCell.self, forCellWithReuseIdentifier: detailCellId)
        collectionView.register(PreviewCell.self, forCellWithReuseIdentifier: previewCellId)
        collectionView.register(ReviewRowCell.self, forCellWithReuseIdentifier: reviewCellId)
        
        navigationItem.largeTitleDisplayMode = .never
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: detailCellId, for: indexPath) as! AppDetailCell
            cell.app = app
            return cell
        } else if indexPath.row == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: previewCellId, for: indexPath) as! PreviewCell
            cell.horizontalController.app = self.app
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reviewCellId, for: indexPath) as! ReviewRowCell
            cell.reviewsController.reviews = self.reviews
            return cell
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.row == 0 {
            
            let dummyCell = AppDetailCell(frame: .init(x: 0, y: 0, width: view.frame.width, height: 1000))
            
            dummyCell.app = app
            
            dummyCell.layoutIfNeeded()
            
            let estimatedSize = dummyCell.systemLayoutSizeFitting(.init(width: view.frame.width, height: 1000))
            
            return .init(width: view.frame.width, height: estimatedSize.height)
            
        } else if indexPath.row == 1 {
            
            return .init(width: view.frame.width, height: 500)
            
        } else {
            
            return .init(width: view.frame.width, height: 280)
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 0, bottom: 16, right: 0)
    }
    
}
