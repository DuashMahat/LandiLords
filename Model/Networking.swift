//
//  Data.swift
//  LandiLords
//
//  Created by Duash on 7/17/20.
//  Copyright © 2020 Duale. All rights reserved.
//

import Foundation

final class Networking {
    func response (url: String , completion: @escaping (Articles) -> () ) {
        guard let url = URL(string: url) else {return}
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            self.urlCompletionHandler(data: data, response: response, error: error, completion: completion)
        }.resume()
    }
    
    
    func urlCompletionHandler (data: Data? , response: URLResponse? , error: Error? , completion: @escaping (Articles) -> () ) {
        guard let data = data else {return}
        do {
           let jsondecoder = JSONDecoder()
           let articles = try jsondecoder.decode(Articles.self, from: data)
           completion(articles)
        } catch {
            print("error  \(error)")
        }
    }
}
