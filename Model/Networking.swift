//
//  Data.swift
//  LandiLords
//
//  Created by Duash on 7/17/20.
//  Copyright © 2020 Duale. All rights reserved.
//

import Foundation

final class Networking {
    func response (url: String , completion: @escaping (States) -> () ) {
        guard let url = URL(string: url) else {return}
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            self.urlCompletionHandler(data: data, response: response, error: error, completion: completion)
        }.resume()
    }
    
    
    func urlCompletionHandler (data: Data? , response: URLResponse? , error: Error? , completion: @escaping (States) -> () ) {
        guard let data = data else {return}
        do {
           let jsondecoder = JSONDecoder()
           let states = try jsondecoder.decode(States.self, from: data)
           completion(states)
        } catch {
            print("error  \(error)")
        }
    }
}
