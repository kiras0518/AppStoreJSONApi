//
//  TrackCell.swift
//  AppStoreJSONApi
//
//  Created by kiras on 2020/3/27.
//  Copyright © 2020 ameyo. All rights reserved.
//

import UIKit

class TrackCell: UICollectionViewCell {
    
    let imageView = UIImageView(cornerRadius: 16)
    let nameLabel = UILabel(text: "Track", font: .boldSystemFont(ofSize: 18))
    let subLabel = UILabel(text: "sub", font: .boldSystemFont(ofSize: 16), numberOfLines: 2)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //imageView.image =
        imageView.constrainWidth(constant: 80)
        
        let stackView = UIStackView(arrangedSubviews: [
            imageView,
            VerticalStackView(arrangedSubview: [
            nameLabel,
            subLabel],spacing: 4)],
            customSpacing: 16)
        
        addSubview(stackView)
        
        stackView.fillSuperview(padding: .init(top: 16, left: 16, bottom: 16, right: 16))
        stackView.alignment = .center
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
