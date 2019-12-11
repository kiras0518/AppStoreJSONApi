//
//  ReviewRowCell.swift
//  AppStoreJSONApi
//
//  Created by kiras on 2019/12/11.
//  Copyright © 2019 ameyo. All rights reserved.
//

import UIKit

class ReviewRowCell: UICollectionViewCell {
    
    let reviewsController = ReviewsController()
    
    let previewLabel = UILabel(text: "Reviews & Ratings", font: .boldSystemFont(ofSize: 20), numberOfLines: 1)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .yellow
        
        addSubview(reviewsController.view)
        reviewsController.view.fillSuperview()
        
        //addSubview(previewLabel)
        //        addSubview(horizontalController.view)
        //
        //        previewLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 20, bottom: 0, right: 20))
        //
        //        horizontalController.view.anchor(top: previewLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 20, left: 0, bottom: 0, right: 0))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
