//
//  StandingsView.swift
//  NBAApp
//
//  Created by André Santana on 21/07/2021.
//

import SwiftUI

struct StandingsView: View {
    
    @StateObject private var gameVM = GameVM()
    @State private var pickedConference = 0
    
    var body: some View {
        ZStack {
            Color.init(UIColor(red: 0.93, green: 0.95, blue: 0.96, alpha: 1.00))
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Text("Standings")
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
                
                Picker(selection: $pickedConference, label: Text("Team")) {
                    Text("East")
                        .tag(0)
                    Text("West")
                        .tag(1)
                }
                .frame(width: 390)
                .colorMultiply(.red)
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                .onReceive([pickedConference].publisher.first()) { (value) in
                    
                }
                
                HStack(spacing: 20) {
                    Text("#")
                        .bold()
                        .offset(x: -10)
                    
                    Text("Team")
                        .bold()
                        .offset(x: 30)
                    
                    Spacer()
                    
                    Text("W - L")
                        .bold()
                }
                .foregroundColor(.gray)
                .padding(.horizontal, 40)
                
                ScrollView(.vertical, showsIndicators: false, content: {
                    VStack(spacing: 10) {
//                        ForEach(gameVM.easternTeams ?? [], id: \.id) { team in
//                            TeamView(index: 1, key: team.key, name: team.name, wins: String(team.wins), losses: String(team.losses))
//                        }
                        
                        ForEach(Array(zip(gameVM.easternTeams?.indices, gameVM.easternTeams ?? [] )), id: \.0) { index, team in
                            TeamView(index: index, key: team.key, name: team.name, wins: String(team.wins), losses: String(team.losses))
                        }
                    }
                })
            }
            .onAppear(perform: {
                gameVM.getStandings()
            })
        }
    }
}

struct StandingsView_Previews: PreviewProvider {
    static var previews: some View {
        StandingsView()
    }
}

struct TeamView: View {
    
    @State public var index: Int
    @State public var key: String
    @State public var name: String
    @State public var wins: String
    @State public var losses: String
    
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                Text(String(index))
                Image(Team.init(key).logo)
                    .resizable()
                    .frame(width: 30, height: 30)
                Text(name)
                
                Spacer()
                
                Text("\(wins) - \(losses)")
                
            }
            .padding()
            .frame(width: 390, height: 50)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .shadow(color: .black.opacity(0.5), radius: 1, x: 0.0, y: 0.0)
        }
    }
}
