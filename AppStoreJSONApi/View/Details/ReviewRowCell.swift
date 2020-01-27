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
    
    let reviewsRatingsLabel = UILabel(text: "Reviews & Ratings", font: .boldSystemFont(ofSize: 20))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .yellow
        
        addSubview(reviewsRatingsLabel)
        addSubview(reviewsController.view)
        
        reviewsRatingsLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 20, left: 20, bottom: 0, right: 20))
        
        reviewsController.view.anchor(top: reviewsRatingsLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 20, left: 0, bottom: 0, right: 0))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
