//
//  MusicDataSource.swift
//  AppStoreJSONApi
//
//  Created by kiras on 2020/5/14.
//  Copyright © 2020 ameyo. All rights reserved.
//

import UIKit

class MusicDataSource: NSObject {
    
    var data: [Result] = []
    private var collectionView: UICollectionView?
    
    var isPagination = false
    var isDonePagination = false
    
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

extension MusicDataSource: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TrackCell.identifier, for: indexPath) as? TrackCell else { fatalError("Cannot dequeue reusable cell") }
        
        let model = data[indexPath.row]
        
        cell.configCell(model: model)
        
        if indexPath.row == data.count - 1 {
            
            print("fetch more data")
            
            isPagination = true
            
            MusicService.shared.fetchMusicCount(counts: 10) { (res, err) in
                
                if res?.results.count == 0 {
                    self.isDonePagination = true
                }
                
                sleep(2)
                
                self.data += res?.results ?? []
                
                DispatchQueue.main.async {
                    collectionView.reloadData()
                }
                
                self.isPagination = false
            }
            
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: MusicLoadingFooter.identifier, for: indexPath)
        
        return footer
    }
}
