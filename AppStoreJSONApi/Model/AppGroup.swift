//
//  AppGroup.swift
//  AppStoreJSONApi
//
//  Created by kiras on 2019/12/2.
//  Copyright © 2019 ameyo. All rights reserved.
//

import Foundation

struct AppGroup: Decodable {
    let feed: Feed
}

struct Feed: Decodable {
    let title: String
    let results: [FeedResult]
}

struct FeedResult: Decodable {
    let name: String
    let artistName: String
    let artworkUrl100: String
}
