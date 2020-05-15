//
//  ViewModelable.swift
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
