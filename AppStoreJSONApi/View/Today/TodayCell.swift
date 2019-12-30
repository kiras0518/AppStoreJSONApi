//
//  TodayCell.swift
//  AppStoreJSONApi
//
//  Created by kiras on 2019/12/22.
//  Copyright © 2019 ameyo. All rights reserved.
//

import UIKit

class TodayCell: UICollectionViewCell {
    
    let imageView = UIImageView(image: #imageLiteral(resourceName: "garden"))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        layer.cornerRadius = 16
        
        addSubview(imageView)
        imageView.contentMode = .scaleAspectFill
        imageView.centerInSuperview(size: .init(width: 250, height: 250))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
