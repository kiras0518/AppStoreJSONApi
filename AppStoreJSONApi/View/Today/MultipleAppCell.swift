//
//  MultipleAppCell.swift
//  AppStoreJSONApi
//
//  Created by kiras on 2020/1/27.
//  Copyright © 2020 ameyo. All rights reserved.
//

import UIKit

class MultipleAppCell: UICollectionViewCell {
    
    var app: FeedResult? {
        didSet {
            nameLable.text = app?.name
            companyLable.text = app?.artistName
            
            imageView.sd_setImage(with: URL(string: app?.artworkUrl100 ?? ""))
        }
    }
    
    let imageView = UIImageView(cornerRadius: 8)
    
    let nameLable = UILabel(text: "App Name", font: .systemFont(ofSize: 20), numberOfLines: 0)
    
    let companyLable = UILabel(text: "Company Name", font: .systemFont(ofSize: 13), numberOfLines: 0)
    
    let getButton = UIButton(title: "GET")
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
        return view
    }()
    
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
        
        addSubview(separatorView)
        separatorView.anchor(top: nil, leading: nameLable.leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 0, bottom: -4, right: 0), size: .init(width: 0, height: 0.5))
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
