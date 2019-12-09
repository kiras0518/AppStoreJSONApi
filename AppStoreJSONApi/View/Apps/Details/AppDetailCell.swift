//
//  AppDetailCell.swift
//  AppStoreJSONApi
//
//  Created by kiras on 2019/12/8.
//  Copyright © 2019 ameyo. All rights reserved.
//

import UIKit

class AppDetailCell: UICollectionViewCell {
    
    var app: Result? {
        didSet {
            nameLabel.text = app?.trackName
            releaseNoteLable.text = app?.releaseNotes
            appIconImageView.sd_setImage(with: URL(string: app?.artworkUrl100 ?? ""))
            priceButton.setTitle(app?.formattedPrice, for: .normal)
        }
    }
    
    let appIconImageView = UIImageView(cornerRadius: 16)
    
    let nameLabel = UILabel(text: "App Name", font: .boldSystemFont(ofSize: 24), numberOfLines: 2)
    
    let priceButton = UIButton(title: "$4.99")
    
    let whatsNewLabel = UILabel(text: "Whats New", font: .boldSystemFont(ofSize: 20), numberOfLines: 0)
    
    let releaseNoteLable = UILabel(text: "Release Notes", font: .systemFont(ofSize: 16), numberOfLines: 0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .lightGray
        
        appIconImageView.backgroundColor = .red
        appIconImageView.constrainWidth(constant: 140)
        appIconImageView.constrainHeight(constant: 140)
        
        priceButton.backgroundColor = .blue
        priceButton.constrainHeight(constant: 32)
        priceButton.constrainWidth(constant: 80)
        priceButton.layer.cornerRadius = 32 / 2
        priceButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        priceButton.setTitleColor(.white, for: .normal)
        
        
        let stackView = VerticalStackView(arrangedSubview: [UIStackView(arrangedSubviews: [appIconImageView,
                        VerticalStackView(arrangedSubview: [nameLabel, UIStackView(arrangedSubviews: [priceButton, UIView()]), UIView()],
                                          spacing: 12)], customSpacing: 20),
                                                            whatsNewLabel,
                                                            releaseNoteLable
                                                            ], spacing: 16)
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 20, left: 20, bottom: 20, right: 20))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension UIStackView {
    convenience init(arrangedSubviews: [UIView], customSpacing: CGFloat = 0) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.spacing = customSpacing
    }
}
