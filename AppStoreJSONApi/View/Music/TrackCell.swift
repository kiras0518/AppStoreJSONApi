//
//  TrackCell.swift
//  AppStoreJSONApi
//
//  Created by kiras on 2020/3/27.
//  Copyright © 2020 ameyo. All rights reserved.
//

import UIKit

class TrackCell: UICollectionViewCell {
    
    static let identifier = "TrackCell"
    
    override var reuseIdentifier: String? {
        return TrackCell.identifier
    }
    
    let imageView = UIImageView(cornerRadius: 16)
    let nameLabel = UILabel(text: "Track", font: .boldSystemFont(ofSize: 18))
    let subLabel = UILabel(text: "sub", font: .boldSystemFont(ofSize: 16), numberOfLines: 2)
    
    func configCell(model: Result) {
        nameLabel.text = model.trackName
        subLabel.text = "\(model.trackName ?? "" ) * \(model.collectionName ?? "")"
        imageView.sd_setImage(with: URL(string: model.artworkUrl100))
    }
    
//    var results: SearchResult? {
//        didSet {
//            guard let model = results else { return }
//
//            //            model.results.map {
//            //                nameLabel.text = $0.trackName
//            //                subLabel.text = "\($0.trackName ?? "" ) * \($0.collectionName ?? "")"
//            //                imageView.sd_setImage(with: URL(string: $0.artworkUrl100))
//            //            }
//
//            model.results.forEach { (res) in
//                nameLabel.text = res.trackName
//                subLabel.text = "\(res.trackName ?? "" ) * \(res.collectionName ?? "")"
//                imageView.sd_setImage(with: URL(string: res.artworkUrl100))
//            }
//
//        }
//    }
    
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
