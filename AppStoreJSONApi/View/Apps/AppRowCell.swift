//
//  AppRowCell.swift
//  AppStoreJSONApi
//
//  Created by kiras on 2019/12/1.
//  Copyright © 2019 ameyo. All rights reserved.
//

import UIKit

class AppRowCell: UICollectionViewCell {
    
    let imageView = UIImageView(cornerRadius: 8)
    
    let nameLable = UILabel(text: "App Name", font: .systemFont(ofSize: 20), numberOfLines: 0)
    
    let companyLable = UILabel(text: "Company Name", font: .systemFont(ofSize: 13), numberOfLines: 0)
    
    let getButton = UIButton(title: "GET")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView.backgroundColor = .black
        imageView.constrainWidth(constant: 64)
        imageView.constrainHeight(constant: 64)
        
        getButton.backgroundColor = UIColor(white: 0.95, alpha: 1)
        getButton.constrainWidth(constant: 80)
        getButton.constrainHeight(constant: 32)
        getButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        getButton.layer.cornerRadius = 32 / 2

        let stackView = UIStackView(arrangedSubviews: [imageView,
            VerticalStackView(arrangedSubview: [nameLable, companyLable], spacing: 4),
                                                       getButton])
        
        stackView.spacing = 16
        stackView.alignment = .center
 
        addSubview(stackView)
        stackView.fillSuperview()
        
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
