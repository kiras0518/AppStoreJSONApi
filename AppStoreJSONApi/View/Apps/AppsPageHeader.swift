//
//  AppsPageHeader.swift
//  AppStoreJSONApi
//
//  Created by kiras on 2019/12/1.
//  Copyright © 2019 ameyo. All rights reserved.
//

import UIKit

class AppsPageHeader: UICollectionReusableView {

    let appHeaderHorizontalController = AppsHeaderHorizontalController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       
        //appHeaderHorizontalController.view.backgroundColor = .purple
        addSubview(appHeaderHorizontalController.view)
        appHeaderHorizontalController.view.fillSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
