//
//  AppsHeaderHorizontalController.swift
//  AppStoreJSONApi
//
//  Created by kiras on 2019/12/1.
//  Copyright © 2019 ameyo. All rights reserved.
//

import UIKit

class AppsHeaderHorizontalController: BaseListControlle, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    
    var socialApps = [SocialApp]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        
        collectionView.register(AppsHeaderCell.self, forCellWithReuseIdentifier: cellId)
        
        // 設置 Cell 滑動方向
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 48, height: view.frame.height)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return socialApps.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppsHeaderCell
        cell.titleLabel.text = socialApps[indexPath.item].name
        cell.company.text = socialApps[indexPath.item].tagline
        cell.imageView.sd_setImage(with: URL(string: socialApps[indexPath.item].imageUrl))
        
        return cell
    }
    
}
