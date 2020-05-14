//
//  AppsHeaderCell.swift
//  AppStoreJSONApi
//
//  Created by kiras on 2019/12/2.
//  Copyright © 2019 ameyo. All rights reserved.
//

import UIKit

class AppsHeaderCell: UICollectionViewCell {
    
    let companyLabel = UILabel(text: "Facebook", font: .boldSystemFont(ofSize: 12), numberOfLines: 0)
    
    let titleLabel = UILabel(text: "Keeping up with friends is faster than ever", font: .systemFont(ofSize: 24), numberOfLines: 0)
    
    let imageView = UIImageView(cornerRadius: 8)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        companyLabel.textColor = .blue
        titleLabel.numberOfLines = 2
        
        let stackView = VerticalStackView(arrangedSubview: [
            companyLabel,
            titleLabel,
            imageView
            ], spacing: 12)
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 16, left: 0, bottom: 0, right: 0))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
