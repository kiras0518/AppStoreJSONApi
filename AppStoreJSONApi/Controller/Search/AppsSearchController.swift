//
//  AppsSearchController.swift
//  AppStoreJSONApi
//
//  Created by kiras on 2019/11/24.
//  Copyright © 2019 ameyo. All rights reserved.
//

import UIKit
import SDWebImage

class AppsSearchController: UICollectionViewController, UISearchBarDelegate {
    
    let searchController = UISearchController(searchResultsController: nil)
    
    let enterSearchLabel: UILabel = {
        let lb = UILabel()
        lb.text = " Please enter serach trem"
        lb.textAlignment = .center
        lb.font = UIFont.boldSystemFont(ofSize: 20)
        return lb
    }()
    
    fileprivate func setupCollectionView() {
        collectionView.backgroundColor = .white
        collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: SearchResultCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    fileprivate func setupSerachBar() {
        view.addSubview(enterSearchLabel)
        enterSearchLabel.fillSuperview(padding: .init(top: 100, left: 50, bottom: 0, right: 50))
        
        definesPresentationContext = true
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }
    
    var timer: Timer?
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        
        timer?.invalidate()
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
            RequestService.shared.fetchApps(searchTerm: searchText) { (res, error) in
                
                if let err = error {
                    print("Failed to fetch apps:", err)
                    return
                }
                
                self.dataSource.data = res?.results ?? []
                
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        })
        
    }
    
    var dataSource = SearchDataSource()
    var viewModel = SearchViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSerachBar()
        setupCollectionView()
        
        viewModel.fetchApps()
        
        viewModel.addObserve(completion: { [weak self] (model) in
            guard let model = model else { return }
            self?.dataSource.update(model)
            self?.dataSource.reloadData()
        })
    }
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        viewModel.removeObserve()
    }
    
}

extension AppsSearchController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 350)
    }
}

extension AppsSearchController {
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        enterSearchLabel.isHidden = dataSource.data.count != 0
        return dataSource.data.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchResultCell.identifier, for: indexPath) as? SearchResultCell else { fatalError("Cannot dequeue reusable cell") }
        
        let model = dataSource.data[indexPath.row]
        
        cell.configCell(model: model)
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let appId = String(dataSource.data[indexPath.row].trackId)
        
        let appDetailCV = AppDetailController(appId: appId)
        
        navigationController?.pushViewController(appDetailCV, animated: true)
    }
}
