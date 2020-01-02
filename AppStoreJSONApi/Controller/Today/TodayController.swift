//
//  TodayController.swift
//  AppStoreJSONApi
//
//  Created by kiras on 2019/12/22.
//  Copyright © 2019 ameyo. All rights reserved.
//

import UIKit

class TodayController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    fileprivate let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = true
        
        collectionView.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        
        collectionView.register(TodayCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! TodayCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 64, height: 450   )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 32
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 32, left: 0, bottom: 32, right: 0)
    }
    
    var appFullScreenController: AppFullscreenController?
    
    var topConstraint: NSLayoutConstraint?
    var ledingConstraint: NSLayoutConstraint?
    var widthConstraint: NSLayoutConstraint?
    var heightConstraint: NSLayoutConstraint?
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Aniimate!!!!")
        
        let appFullscreenCV = AppFullscreenController()
        appFullscreenCV.view.backgroundColor = .yellow
        
        let redView = appFullscreenCV.view!
        redView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleRemoveRedView)))
        view.addSubview(redView)
        
        addChild(appFullscreenCV)
        
        self.appFullScreenController = appFullscreenCV
        
        guard let cell = collectionView.cellForItem(at: indexPath) else { return }
        
        // abouslte coordindates of cell
        guard let startFrame = cell.superview?.convert(cell.frame, to: nil) else { return }
        
        self.startingFrame = startFrame
        
        redView.translatesAutoresizingMaskIntoConstraints = false
        
        topConstraint = redView.topAnchor.constraint(equalTo: view.topAnchor, constant: startFrame.origin.y)
        ledingConstraint = redView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: startFrame.origin.x)
        
        widthConstraint = redView.widthAnchor.constraint(equalToConstant: startFrame.width)
        heightConstraint = redView.heightAnchor.constraint(equalToConstant: startFrame.height)
        
        [topConstraint, ledingConstraint, widthConstraint, heightConstraint].forEach({$0?.isActive = true})
        self.view.layoutIfNeeded()
        
        redView.frame = startFrame
        
        redView.layer.cornerRadius = 16
        
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut, animations: {
            redView.frame = self.view.frame
            
            self.topConstraint?.constant = 0
            self.ledingConstraint?.constant = 0
            self.widthConstraint?.constant = self.view.frame.width
            self.heightConstraint?.constant = self.view.frame.height
            
            self.view.layoutIfNeeded() // starts Animation
            
            self.tabBarController?.tabBar.transform = CGAffineTransform(translationX: 0, y: 100)
            
        }, completion: nil)
    }
    
    var startingFrame: CGRect?
    
    @objc func handleRemoveRedView(gesture: UITapGestureRecognizer) {
  
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut, animations: {
            // this frame code is bad
            //gesture.view?.frame = self.startingFrame ?? .zero
            
            self.appFullScreenController?.tableView.contentOffset = .zero
            
            guard let startingFrame = self.startingFrame else { return }
            
            self.topConstraint?.constant = startingFrame.origin.y
            self.ledingConstraint?.constant = startingFrame.origin.x
            self.widthConstraint?.constant = startingFrame.width
            self.heightConstraint?.constant = startingFrame.height
            
            self.view.layoutIfNeeded()
            
            self.tabBarController?.tabBar.transform = .identity
            
        }, completion: { _ in
            gesture.view?.removeFromSuperview()
            self.appFullScreenController?.removeFromParent()
        })
    }
}
