//
//  VerticalStackView.swift
//  AppStoreJSONApi
//
//  Created by kiras on 2019/11/24.
//  Copyright © 2019 ameyo. All rights reserved.
//

import UIKit

class VerticalStackView: UIStackView {
    
    init(arrangedSubview: [UIView], spacing: CGFloat = 0) {
        super.init(frame: .zero)
        
        arrangedSubview.forEach({addArrangedSubview($0)})
        
        self.spacing = spacing
        self.axis = .vertical
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
