//
//  SocialViewModel.swift
//  AppStoreJSONApi
//
//  Created by kiras on 2020/5/13.
//  Copyright © 2020 ameyo. All rights reserved.
//

import Foundation

struct SocialViewModel {
    
        private var completion: (([SocialApp]?) -> Void)?
    
        private let service: RequestService
    
        private var model: [SocialApp]? {
            didSet {
                completion?(model)
            }
        }
    
        init(service: RequestService = RequestService.shared) {
            self.service = service
        }
    
    

}

