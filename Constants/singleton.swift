//
//  singleton.swift
//  LandiLords
//
//  Created by Duash on 7/19/20.
//  Copyright © 2020 Duale. All rights reserved.
//

import Foundation

final class UrlPath {
    static let path = UrlPath()
    private init() {}
    var urlpath : String = "https://newsapi.org/v2/everything?q=apple&apiKey=413e01ed3481472c935caf2fcacbedc4&language=en&page=1"
    var statesUrl = "http://www.json-generator.com/api/json/get/cexiXfzbTm?indent=2"
    var firstpath = "https://www.apartments.com/"
    var lastpath = "/?&frontdoor=google&gclid=Cj0KCQjw4f35BRDBARIsAPePBHx7zE2IEEOqAM3mmz2fyCVMBPNemKZx270LEugySma819EQfq9GtlMaAndiEALw_wcB&gclsrc=aw.ds"
    func shared() -> String {
       return urlpath
    }
    func sharedStatesUrl() -> String {
        return statesUrl
    }
}
