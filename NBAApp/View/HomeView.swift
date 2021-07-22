//
//  HomeView.swift
//  NBAApp
//
//  Created by André Santana on 13/07/2021.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var gameVM = GameVM()
    
    @State private var pickedDate = 1
    @State var selectedTab: String = "sportscourt"
    
    init() {
        UINavigationBar.appearance().isHidden = true
    }
    
    var body: some View {
        TabView {
            LandingView(pickedDate: $pickedDate, gameVM: gameVM)
                .tag("sportscourt")
                .tabItem {
                    Image(systemName: "sportscourt")
                    Text("Scores")
                }
            
            StandingsView()
                .tag("list.number")
                .tabItem {
                    Image(systemName: "list.number")
                    Text("Standings")
                }
            
            SettingsView()
                .tag("gearshape")
                .tabItem {
                    Image(systemName: "gearshape")
                    Text("Settings")
                }
            
        }
        .accentColor(.blue)
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct LandingView: View {
    
    @Binding public var pickedDate: Int
    @StateObject public var gameVM = GameVM()
    @State private var date: String = ""
    
    var body: some View {
        ZStack {
            Color.init(UIColor(red: 0.93, green: 0.95, blue: 0.96, alpha: 1.00))
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Text("Games")
                        .bold()
                        .font(.title)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    Image("logo")
                        .resizable()
                        .frame(width: 50, height: 80)
                        .aspectRatio(contentMode: .fit)
                }
                .padding(.horizontal, 15)
                                
                Picker(selection: $pickedDate, label: Text("Day")) {
                    Text("Yesterday")
                        .tag(0)
                    Text("Today")
                        .tag(1)
                    Text("Tomorrow")
                        .tag(2)
                }
                .frame(width: 390)
                .colorMultiply(.red)
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                .onReceive([pickedDate].publisher.first()) { (value) in
                    date = getPickedDate(value: value)
                }
                
                VStack(spacing: 15) {
                    
                    if gameVM.games?.count == 0 {
                        Text("No games scheduled for this day.")
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                            .font(.title3)
                    } else {
                        ForEach(gameVM.games ?? [], id: \.id) { game in
                            BoardView(homeTeam: game.homeTeam, awayTeam: game.awayTeam, date: date, status: game.status ?? "")
                        }
                    }
                }

                Spacer()
                
            }
        }
    }
    
    private func getPickedDate(value: Int) -> String {
        switch value {
        case 0:
            self.gameVM.getGamesByDate(Date().dayBefore.getFormattedDate())
            return Date().dayBefore.getFormattedDate()
        case 1:
            self.gameVM.getGamesByDate(Date().getFormattedDate())
            return Date().getFormattedDate()
        case 2:
            self.gameVM.getGamesByDate(Date().dayAfter.getFormattedDate())
            return Date().dayAfter.getFormattedDate()
        default:
            self.gameVM.getGamesByDate(Date().getFormattedDate())
            return Date().getFormattedDate()
        }
    }
}

struct BoardView: View {
    
    @State public var homeTeam: String
    @State public var awayTeam: String
    @State public var date: String
    @State public var status: String
    
    var body: some View {
        VStack {
            HStack(spacing: 50) {
                Image(Team(homeTeam).logo)
                    .resizable()
                    .frame(width: 80, height: 80)
                    .aspectRatio(contentMode: .fill)
                
                Text("VS")
                    .bold()
                
                Image(Team(awayTeam).logo)
                    .resizable()
                    .frame(width: 80, height: 80)
                    .aspectRatio(contentMode: .fill)
            }
            .padding()
            
            HStack(spacing: 140) {
                Text(homeTeam)
                    .bold()
                
                Text(awayTeam)
                    .bold()
                
            }
            .multilineTextAlignment(.leading)
            .padding()
            .offset(y: -15)
            
            VStack {
                Text(status)
                    .bold()
                
                Text(date)
            }
            .offset(y: -10)
        }
        .padding()
        .frame(width: 390, height: 220)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 25.0))
        .shadow(color: .black.opacity(0.5), radius: 4, x: 0.0, y: 0.0)
    }
}
