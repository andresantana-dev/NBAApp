//
//  Standing.swift
//  NBAApp
//
//  Created by André Santana on 22/07/2021.
//

import Foundation

struct Standing: Identifiable, Codable {
    let id = UUID()
    let key: String
    let name: String
    let conference: String
    let wins, losses: Int

    enum CodingKeys: String, CodingKey {
        case id
        case key = "Key"
        case name = "Name"
        case conference = "Conference"
        case wins = "Wins"
        case losses = "Losses"
    }
}
