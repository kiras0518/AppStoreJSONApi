//
//  SearchResult.swift
//  AppStoreJSONApi
//
//  Created by kiras on 2019/11/27.
//  Copyright © 2019 ameyo. All rights reserved.
//

import Foundation

struct SearchResult: Decodable {
    let resultCount: Int
    let results: [Result]
}

struct Result: Decodable {
    let trackName: String
    let primaryGenreName: String
    var averageUserRating: Float?
}

