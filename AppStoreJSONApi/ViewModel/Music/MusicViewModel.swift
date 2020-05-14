//
//  MusicViewModel.swift
//  AppStoreJSONApi
//
//  Created by kiras on 2020/5/14.
//  Copyright © 2020 ameyo. All rights reserved.
//

import Foundation

protocol ViewModelable {
    associatedtype Model
    
    func addObserve(completion: @escaping (Model?) -> Void)
    func removeObserve()
}

class MusicViewModel {
    
    private var completion: (([Result]?) -> Void)?
    private let service: MusicService
    
    private var model: [Result]? {
        didSet {
            completion?(model)
        }
    }
    
    init(service: MusicService = MusicService.shared) {
        self.service = service
    }
    
    func fetchMusic() {
        service.fetchMusic(searchTerm: "taylor") { [weak self] (res, err) in
            self?.model = res?.results
        }
    }
    
    func fetchMusicCount() {
        service.fetchMusicCount(counts: 10) { [weak self] (res, err) in
            self?.model = res?.results
        }
    }
}

extension MusicViewModel: ViewModelable {
    typealias Model = [Result]
    
    func addObserve(completion: @escaping ([Result]?) -> Void) {
        self.completion = completion
    }
    
    func removeObserve() {
        self.completion = nil
    }
}
