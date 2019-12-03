//
//  AppsHeaderCell.swift
//  AppStoreJSONApi
//
//  Created by kiras on 2019/12/2.
//  Copyright © 2019 ameyo. All rights reserved.
//

import UIKit

class AppsHeaderCell: UICollectionViewCell {
    
    let company = UILabel(text: "FackBook", font: .boldSystemFont(ofSize: 12))
    let titleLabel = UILabel(text: "Keeping up with friends", font: .systemFont(ofSize: 30))
    let imageView = UIImageView(cornerRadius: 8)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //imageView.backgroundColor = .red
        titleLabel.numberOfLines = 2
        company.textColor = .blue
        
        let stackView = VerticalStackView(arrangedSubview:  [company, titleLabel, imageView], spacing: 12)
        
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 16, left: 0, bottom: 0, right: 0))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
