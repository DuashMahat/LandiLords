//
//  viewModel.swift
//  LandiLords
//
//  Created by Duash on 7/22/20.
//  Copyright © 2020 Duale. All rights reserved.
//

import Foundation

final class NetworkViewModel {
    var states = [State]()
    var filteredStates = [State]()
    var networking = Networking()
    var isFetchingResponse : Bool = false
    var currentIndex : Int = 1
    func vmResponse ( url: String  , completion: @escaping (States) -> () ) {
        networking.response(url: url) { [weak self] states in
            self?.states = states.states
            completion(states)
        }
    }
    func mainStates () -> [State] {
       return states
    }
    
    func filteredStated () -> [State] {
       return filteredStates
    }
    
    func Maincount() -> Int {
        return states.count
    }
    func filteredCount() -> Int {
        return filteredStates.count
    }
    
    func getArtatIndexMain (index: Int ) -> State {
       return states[index]
    }
    
    func getArtatIndexAtFilered (index: Int ) -> State {
       return filteredStates[index]
    }
}
