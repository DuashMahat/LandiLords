//
//  viewModel.swift
//  LandiLords
//
//  Created by Duash on 7/22/20.
//  Copyright © 2020 Duale. All rights reserved.
//

import Foundation

final class NetworkViewModel {
    var articles = [Article]()
    var filteredArticles = [Article]()
    var networking = Networking()
    var isFetchingResponse : Bool = false
    var currentIndex : Int = 1
    func vmResponse ( url: String  , completion: @escaping (Articles) -> () ) {
        networking.response(url: url) { [weak self] article in
            self?.articles = article.articles
            completion(article)
        }
    }
    func mainArticles () -> [Article] {
       return articles
    }
    
    func filteredArticled() -> [Article] {
       return filteredArticles
    }
    
    func Maincount() -> Int {
        return articles.count
    }
    func filteredCount() -> Int {
        return filteredArticles.count
    }
    
    func getArtatIndexMain (index: Int ) -> Article {
       return articles[index]
    }
    
    func getArtatIndexAtFilered (index: Int ) -> Article {
       return filteredArticles[index]
    }
}
