//
//  SearchDataSource.swift
//  AppStoreJSONApi
//
//  Created by kiras on 2020/5/14.
//  Copyright © 2020 ameyo. All rights reserved.
//

import UIKit

class SearchDataSource: NSObject {
    
    var data: [Result] = []
    var collectionView: UICollectionView?
   
    func inject(_ collectionView: UICollectionView) {
        self.collectionView = collectionView
    }
    
    func update(_ models: [Result]) {
        self.data += models
    }
    
    func reloadData() {
        collectionView?.reloadData()
    }
}

//extension SearchDataSource: UICollectionViewDataSource {
//
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        //enterSearchLabel.isHidden = appRusults.count != 0
//        print(appsSearchVC?.enterSearchLabel.isHidden)
//        appsSearchVC?.enterSearchLabel.isHidden = data.count != 0
//        return data.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchResultCell.identifier, for: indexPath) as? SearchResultCell else { fatalError("Cannot dequeue reusable cell") }
//
//        let model = data[indexPath.row]
//
//        cell.configCell(model: model)
//
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//
//        let appId = String(data[indexPath.row].trackId)
//
//        let appDetailCV = AppDetailController(appId: appId)
//
//        //navigationController?.pushViewController(appDetailCV, animated: true)
//     }
//}
