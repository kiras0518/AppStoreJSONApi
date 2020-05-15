//
//  ViewControllersFactory.swift
//  AppStoreJSONApi
//
//  Created by kiras on 2020/5/14.
//  Copyright © 2020 ameyo. All rights reserved.
//

import Foundation

protocol ViewControllersFactory {
    associatedtype ViewController
    
    static func makeInitateViewController() -> ViewController
}
