//
//  ReviewCell.swift
//  AppStoreJSONApi
//
//  Created by kiras on 2019/12/11.
//  Copyright © 2019 ameyo. All rights reserved.
//

import UIKit

class ReviewCell: UICollectionViewCell {
    
    let reviewsController = ReviewsController()
    
    let titleLabel = UILabel(text: "Reviews Title", font: .boldSystemFont(ofSize: 16), numberOfLines: 1)
    
    let authorLabel = UILabel(text: "Author", font: .systemFont(ofSize: 16))
    
    let starsLabel = UILabel(text: "Stars", font: .systemFont(ofSize: 14))
    
    let bodyLabel = UILabel(text: "Review body\nReview body\nReview body\n", font: .systemFont(ofSize: 16), numberOfLines: 0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .yellow
        
        layer.cornerRadius = 16
        
        clipsToBounds = true

        let stackView = VerticalStackView(arrangedSubview: [ UIStackView(arrangedSubviews: [titleLabel, UIView(), authorLabel]),
                                                             starsLabel, bodyLabel], spacing: 12)
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 12, left: 12, bottom: 12, right: 12))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
