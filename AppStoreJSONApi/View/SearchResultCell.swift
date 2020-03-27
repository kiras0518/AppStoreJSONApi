//
//  SearchResultCell.swift
//  AppStoreJSONApi
//
//  Created by kiras on 2019/11/24.
//  Copyright © 2019 ameyo. All rights reserved.
//

import UIKit

class SearchResultCell: UICollectionViewCell {
    
    var appResult: Result? {
        didSet {
            guard let model = appResult else { return }
            nameLable.text = model.trackName
            categoryLable.text = model.primaryGenreName
            ratingsLable.text = "Rating: \(model.averageUserRating ?? 0)"
            
            let url = URL(string: model.artworkUrl100)
            appIconImageView.sd_setImage(with: url)
            
            screenshot1ImageView.sd_setImage(with: URL(string: model.screenshotUrls?[0] ?? ""))
            
            if model.screenshotUrls?.count ?? 0 > 1 {
                screenshot2ImageView.sd_setImage(with: URL(string: model.screenshotUrls?[1] ?? ""))
            }
            
            if model.screenshotUrls?.count ?? 0 > 2 {
                screenshot3ImageView.sd_setImage(with: URL(string: model.screenshotUrls?[2] ?? ""))
            }
            
        }
    }
    
    lazy var appIconImageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .red
        iv.widthAnchor.constraint(equalToConstant: 64).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 64).isActive = true
        iv.layer.cornerRadius = 12
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var nameLable: UILabel = {
        let lb = UILabel()
        lb.text = "App Name"
        return lb
    }()
    
    lazy var categoryLable: UILabel = {
        let lb = UILabel()
        lb.text = "Photo & Video"
        return lb
    }()
    
    lazy var ratingsLable: UILabel = {
        let lb = UILabel()
        lb.text = "9.26M"
        return lb
    }()
    
    lazy var getButton: UIButton = {
        let bt = UIButton()
        bt.setTitle("GET", for: .normal)
        bt.setTitleColor(.blue, for: .normal)
        bt.backgroundColor = .darkGray
        bt.widthAnchor.constraint(equalToConstant: 80).isActive = true
        bt.heightAnchor.constraint(equalToConstant: 32).isActive = true
        bt.layer.cornerRadius = 16
        return bt
    }()
    
    lazy var screenshot1ImageView = self.createScreenshotImageView()
    lazy var screenshot2ImageView = self.createScreenshotImageView()
    lazy var screenshot3ImageView = self.createScreenshotImageView()
    
    func createScreenshotImageView () -> UIImageView {
        let iv = UIImageView()
        iv.layer.cornerRadius = 8
        iv.clipsToBounds = true
        iv.layer.borderWidth = 0.5
        iv.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
        iv.contentMode = .scaleAspectFill
        return iv
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        let labelStackView = VerticalStackView(arrangedSubview: [nameLable, categoryLable, ratingsLable])
        
        let infoTopStackView = UIStackView(arrangedSubviews: [appIconImageView, labelStackView, getButton])
        infoTopStackView.spacing = 12
        infoTopStackView.alignment = .center
        
        let screenshotsStackView = UIStackView(arrangedSubviews: [screenshot1ImageView, screenshot2ImageView, screenshot3ImageView])
        screenshotsStackView.spacing = 12
        screenshotsStackView.distribution = .fillEqually
        
        let overallStackView = VerticalStackView(arrangedSubview: [infoTopStackView, screenshotsStackView], spacing: 16)
        
        addSubview(overallStackView)
        overallStackView.fillSuperview(padding: .init(top: 16, left: 16, bottom: 16, right: 16))

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
