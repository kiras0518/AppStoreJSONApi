//
//  MusicLoadingFooter.swift
//  AppStoreJSONApi
//
//  Created by kiras on 2020/3/27.
//  Copyright © 2020 ameyo. All rights reserved.
//

import UIKit

class MusicLoadingFooter: UICollectionReusableView {
    
    static let identifier = "MusicLoadingFooter"
    
    override var reuseIdentifier: String? {
        return MusicLoadingFooter.identifier
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let aiv = UIActivityIndicatorView(style: .large)
        aiv.color = .darkGray
        aiv.startAnimating()
        
        let label = UILabel(text: "Loading more....", font: .systemFont(ofSize: 16))
        label.textAlignment = .center
        
        let stackView = VerticalStackView(arrangedSubview: [aiv, label]
            , spacing: 8)
        
        addSubview(stackView)
        stackView.centerInSuperview(size: .init(width: 200, height: 0))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//class MusicLoading: UIView {
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//        let aiv = UIActivityIndicatorView(style: .large)
//        aiv.color = .darkGray
//        aiv.startAnimating()
//
//        let label = UILabel(text: "Loading more....", font: .systemFont(ofSize: 16))
//        label.textAlignment = .center
//
//        let stackView = VerticalStackView(arrangedSubview: [aiv, label]
//            , spacing: 8)
//
//        addSubview(stackView)
//        stackView.centerInSuperview(size: .init(width: 200, height: 0))
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}
