//
//  singleton.swift
//  LandiLords
//
//  Created by Duash on 7/19/20.
//  Copyright © 2020 Duale. All rights reserved.
//

import Foundation

class UrlPath {
    static let path = UrlPath()
    private init() {}
    var urlpath : String = "https://newsapi.org/v2/everything?q=apple&apiKey=413e01ed3481472c935caf2fcacbedc4&language=en&page=1"
    func shared() -> String {
       return urlpath
    }
}
