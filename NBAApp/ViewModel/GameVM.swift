//
//  GameVM.swift
//  NBAApp
//
//  Created by André Santana on 15/07/2021.
//

import Foundation

class GameVM: ObservableObject {
    
    @Published var games: [Game]? = []
    @Published var teams: [Standing]? = []
    @Published var easternTeams: [Standing]? = []
    @Published var westernTeams: [Standing]? = []
    
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
    
    public func getStandings() {
        ServiceAPI.shared.getStandings { [weak self] result in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let standings):
                self?.teams = standings
                self?.easternTeams = standings.filter({$0.conference == "Eastern" })
                self?.westernTeams = standings.filter({$0.conference == "Western" })
            }
        }
    }
}
