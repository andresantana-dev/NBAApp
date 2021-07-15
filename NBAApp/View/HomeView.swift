//
//  HomeView.swift
//  NBAApp
//
//  Created by André Santana on 13/07/2021.
//

import SwiftUI

struct HomeView: View {
    
    @State private var pickedDate = 0
    @State var selectedTab: String = "sportscourt"
    
    init() {
        UITabBar.appearance().isHidden = true
        UINavigationBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        VStack {
            TabView {
                LandingView(pickedDate: $pickedDate)
                    .tag("sportscourt")
                
                Color.pink
                    .tag("list.number")
                
                Color.yellow
                    .tag("gearshape")
                
            }
            
            
            CustomTabBarView(selectedTab: $selectedTab)
                .frame(height: 40)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct LandingView: View {
    
    @Binding public var pickedDate: Int
    
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
                                
                Picker(selection: $pickedDate, label: Text("What is your favorite color?")) {
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
                
                VStack(spacing: 15) {
                    BoardView()
                    
                    BoardView()
                }

                

                Spacer()
                
            }
        }
    }
}

struct BoardView: View {
    var body: some View {
        VStack {
            HStack(spacing: 50) {
                Image("logo")
                    .resizable()
                    .frame(width: 50, height: 80)
                    .aspectRatio(contentMode: .fit)
                
                Text("VS")
                    .bold()
                
                Image("logo")
                    .resizable()
                    .frame(width: 50, height: 80)
                    .aspectRatio(contentMode: .fit)
            }
            .padding()
            
            HStack(spacing: 140) {
                Text("LAL")
                    .bold()
                
                Text("PHQ")
                    .bold()
                
            }
            .multilineTextAlignment(.leading)
            .padding()
            .offset(y: -15)
            
            Text("Scheduled @ 10:30 PM")
                .bold()
        }
        .padding()
        .frame(width: 390, height: 220)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 25.0))
        .shadow(color: .black.opacity(0.5), radius: 4, x: 0.0, y: 0.0)
    }
}
