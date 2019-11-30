//
//  BaseListController.swift
//  AppStoreJSONApi
//
//  Created by kiras on 2019/11/30.
//  Copyright © 2019 ameyo. All rights reserved.
//

import UIKit

class BaseListControlle: UICollectionViewController {
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
