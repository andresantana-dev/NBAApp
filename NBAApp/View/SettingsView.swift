//
//  SettingsView.swift
//  NBAApp
//
//  Created by André Santana on 22/07/2021.
//

import SwiftUI

struct SettingsView: View {
    
    @StateObject private var gameVM = GameVM()
    @AppStorage("favoriteTeam") var favoriteTeam = ""
    
    var body: some View {
        ZStack {
            Color.init(UIColor(red: 0.93, green: 0.95, blue: 0.96, alpha: 1.00))
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Text("Settings")
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
                
                Text("Pick your Favorite Team")
                    .bold()
                    .font(.title)
                    .foregroundColor(.black)
                
                List(gameVM.teams ?? [], id: \.id) { team in
                    VStack {
                        HStack(spacing: 20) {
                            Image(Team.init(team.key).logo)
                                .resizable()
                                .frame(width: 30, height: 30)
                            
                            Text(team.name)
                                .onTapGesture {
                                    favoriteTeam = team.name
                                }
                            
                            Spacer()
                            
                            if favoriteTeam == team.name {
                                Image(systemName: "star.fill")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.yellow)
                                    .offset(x: -20)
                            }

                        }
                        .padding()
                        .frame(width: 390, height: 50)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        .shadow(color: .black.opacity(0.5), radius: 1, x: 0.0, y: 0.0)
                    }
                }
                .padding()
            }
            .onAppear {
                gameVM.getStandings()
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
