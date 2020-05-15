//
//  SearchViewModel.swift
//  AppStoreJSONApi
//
//  Created by kiras on 2020/5/14.
//  Copyright © 2020 ameyo. All rights reserved.
//

import Foundation

class SearchViewModel {
    
    private var completion: (([Result]?)-> Void)?
    private let service: RequestService
    
    private var model: [Result]? {
        didSet {
            completion?(model)
        }
    }
    
    init(service: RequestService = RequestService.shared) {
        self.service = service
    }
    
    func fetchApps() {
        service.fetchApps(searchTerm: "Twitter") { [weak self] (res, err) in
            self?.model = res?.results
        }
    }
}

extension SearchViewModel: ViewModelable {
    typealias Model = [Result]
    
    func addObserve(completion: @escaping ([Result]?) -> Void) {
        self.completion = completion
    }
    
    func removeObserve() {
        self.completion = nil
    }
}
