//
//  Game.swift
//  NBAApp
//
//  Created by André Santana on 15/07/2021.
//

import Foundation

struct Game: Identifiable, Codable {
    let id = UUID()
    let homeTeam, awayTeam: String
    let awayTeamScore, homeTeamScore: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case awayTeam = "AwayTeam"
        case homeTeam = "HomeTeam"
        case awayTeamScore = "AwayTeamScore"
        case homeTeamScore = "HomeTeamScore"
    }
}
