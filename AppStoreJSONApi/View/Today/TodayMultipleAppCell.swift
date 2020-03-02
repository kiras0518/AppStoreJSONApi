//
//  TodayMultipleAppCell.swift
//  AppStoreJSONApi
//
//  Created by kiras on 2020/1/12.
//  Copyright © 2020 ameyo. All rights reserved.
//

import UIKit

class TodayMultipleAppCell: BaseTodayCell {
    
   override var todayItem: TodayItem? {
        didSet {
            categoryLabel.text = todayItem?.category
            titleLabel.text = todayItem?.title
            
            multipleAppVC.apps = todayItem?.apps ?? []
            multipleAppVC.collectionView.reloadData()
        }
    }
    
    let categoryLabel = UILabel(text: "LIFE HACK", font: .boldSystemFont(ofSize: 20))
    let titleLabel = UILabel(text: "Utilizing your Time", font: .boldSystemFont(ofSize: 28), numberOfLines: 2)
    
    let multipleAppVC = TodayMultipleAppsController(mode: .small)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        layer.cornerRadius = 16
        
        //multipleAppVC.view.backgroundColor = .red
        layer.shadowOpacity = 0.1
        layer.shadowRadius = 10
        layer.shadowOffset = .init(width: 0, height: 10)
        
        let stackView = VerticalStackView(arrangedSubview: [categoryLabel, titleLabel, multipleAppVC.view], spacing: 12)
     
        
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 24, left: 24, bottom: 24, right: 24))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
