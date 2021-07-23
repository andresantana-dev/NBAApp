//
//  Team.swift
//  NBAApp
//
//  Created by André Santana on 21/07/2021.
//

import Foundation

enum Team {
    case atlanta, bulls, cavaliers, celtics, clippers, dallas, denver, hornets, houston, indiana, jazz, knicks, lakers, magic, memphis, miami, milwaukee, minnesota, nets, pelicans, philadelphia, pistons, portland, raptors, sacramento, spurs, suns, thunder, warriors, wizards, none
    init(_ team: String?) {
        switch (team) {
        case "PHI": self = .philadelphia
        case "BKN": self = .nets
        case "NY": self = .knicks
        case "BOS": self = .celtics
        case "TOR": self = .raptors
        case "MIL": self = .milwaukee
        case "IND": self = .indiana
        case "CHI": self = .bulls
        case "CLE": self = .cavaliers
        case "DET": self = .pistons
        case "ATL": self = .atlanta
        case "MIA": self = .miami
        case "WAS": self = .wizards
        case "CHA": self = .hornets
        case "ORL": self = .magic
        case "UTA": self = .jazz
        case "DEN": self = .denver
        case "POR": self = .portland
        case "MIN": self = .minnesota
        case "OKC": self = .thunder
        case "PHO": self = .suns
        case "LAC": self = .clippers
        case "LAL": self = .lakers
        case "GS": self = .warriors
        case "SAC": self = .sacramento
        case "DAL": self = .dallas
        case "MEM": self = .memphis
        case "SA": self = .spurs
        case "HOU": self = .houston
        case "NO": self = .pelicans
        default: self = .none
        }
    }
    
    var logo: String {
        switch self {
        case .atlanta: return "atlanta"
        case.bulls: return "bulls"
        case .cavaliers: return "cavaliers"
        case .celtics: return "celtics"
        case .clippers: return "clippers"
        case .dallas: return "dallas"
        case .denver: return "denver"
        case .hornets: return "hornets"
        case .houston: return "houston"
        case .indiana: return "indiana"
        case .jazz: return "jazz"
        case .knicks: return "knicks"
        case .lakers: return "lakers"
        case .magic: return "magic"
        case .memphis: return "memphis"
        case .miami: return "miami"
        case .milwaukee: return "milwaukee"
        case .minnesota: return "minnesota"
        case .nets: return "nets"
        case .pelicans: return "pelicans"
        case .philadelphia: return "philadelphia"
        case .pistons: return "pistons"
        case .portland: return "portland"
        case .raptors: return "raptors"
        case .sacramento: return "sacramento"
        case .spurs: return "spurs"
        case .suns: return "suns"
        case .thunder: return "thunder"
        case .warriors: return "warriors"
        case .wizards: return "wizards"
        case .none: return "logo"
        }
    }
}
