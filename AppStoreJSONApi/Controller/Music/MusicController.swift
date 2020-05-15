//
//  MusicController.swift
//  AppStoreJSONApi
//
//  Created by kiras on 2020/3/27.
//  Copyright © 2020 ameyo. All rights reserved.
//

import UIKit


class MusicController: BaseListController {
    
    var dataSource = MusicDataSource()
    var viewModel = MusicViewModel()

    fileprivate func setupCollectionView() {
        collectionView.backgroundColor = .white
        collectionView.register(TrackCell.self, forCellWithReuseIdentifier: TrackCell.identifier)
        collectionView.register(MusicLoadingFooter.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: MusicLoadingFooter.identifier)
        collectionView.delegate = self
        collectionView.dataSource = dataSource
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        
        viewModel.fetchMusic()
        
        viewModel.addObserve(completion: { [weak self] (model) in
            guard let model = model else { return }
            self?.dataSource.update(model)
            self?.dataSource.reloadData()
        })
    }
    
    deinit {
        viewModel.removeObserve()
    }
}

//extension MusicController: ViewControllersFactory {
//
//    typealias ViewController = MusicController
//
//    static func makeInitateViewController() -> MusicController {
//        let vc = MusicController()
//        vc.dataSource = MusicDataSource()
//        vc.dataSource?.inject(vc.collectionView)
//        vc.viewModel = MusicViewModel()
//        return vc
//    }
//}

extension MusicController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        let height: CGFloat = dataSource.isDonePagination ? 0 : 100
        return .init(width: view.frame.width, height: height)
    }
}
