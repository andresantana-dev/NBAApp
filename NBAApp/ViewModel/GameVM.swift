//
//  GameVM.swift
//  NBAApp
//
//  Created by André Santana on 15/07/2021.
//

import Foundation

class GameVM: ObservableObject {
    
    @Published var games: [Game]? = []
    
    public func getGamesByDate(_ date: String) {
        ServiceAPI.shared.getGames(date: date) { [weak self] result in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let games):
                self?.games = games
            }
        }
    }
}
