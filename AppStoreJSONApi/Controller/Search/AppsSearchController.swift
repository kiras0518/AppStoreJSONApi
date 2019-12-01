//
//  AppsSearchController.swift
//  AppStoreJSONApi
//
//  Created by kiras on 2019/11/24.
//  Copyright © 2019 ameyo. All rights reserved.
//

import UIKit
import SDWebImage

class AppsSearchController: UICollectionViewController, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    fileprivate let cellId = "id1234"
    
    fileprivate let searchController = UISearchController(searchResultsController: nil)
    
    fileprivate let enterSearchLabel: UILabel = {
       let lb = UILabel()
        lb.text = " Please enter serach trem"
        lb.textAlignment = .center
        lb.font = UIFont.boldSystemFont(ofSize: 20)
        return lb
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        
        collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: cellId)
        
        view.addSubview(enterSearchLabel)
        enterSearchLabel.fillSuperview(padding: .init(top: 100, left: 50, bottom: 0, right: 50))
        
        setupSerachBar()
        
        fetchiTunesApps()
        
    }
    
    fileprivate func setupSerachBar() {
        definesPresentationContext = true
        navigationItem.searchController = self.searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        
    }
    var timer: Timer?
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        
        timer?.invalidate()
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
            Service.shared.fetchApps(searchTerm: searchText) { (res, error) in
                self.appRusults = res
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        })
        
    }
    
    fileprivate var appRusults = [Result]()
    
    fileprivate func fetchiTunesApps() {
        
        Service.shared.fetchApps(searchTerm: "Twitter")  { (results, err)  in
            
            if let err = err {
                print("Failed to Feach", err)
                return
            }
            
            self.appRusults = results
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 350)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        enterSearchLabel.isHidden = appRusults.count != 0
        return appRusults.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SearchResultCell
        
        cell.appResult = appRusults[indexPath.row]
        
        return cell
    }
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
