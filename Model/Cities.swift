//
//  Cities.swift
//  LandiLords
//
//  Created by Duash on 7/17/20.
//  Copyright © 2020 Duale. All rights reserved.
//

import Foundation
//struct Cities
// MARK: - Welcome
struct Articles : Codable {
    var status: String
    var totalResults: Int
    var articles: [Article]
}

// MARK: - Article
struct Article: Codable {
//    let source: Source
    let author, title, description : String
    let url: String
    let urlToImage: String
    let content: String
//    enum CodingKeys: String, CodingKey {
//        case source, author, title
//        case articleDescription = "description"
//        case url, urlToImage,content
//    }
}

// MARK: - Source
struct Source: Codable {
    let id: ID?
    let name: String
}

enum ID: String, Codable {
    case engadget = "engadget"
    case mashable = "mashable"
    case techcrunch = "techcrunch"
}
