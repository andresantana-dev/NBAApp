//
//  ContentView.swift
//  NBAApp
//
//  Created by André Santana on 06/07/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Image("jordan")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                VStack() {
                    Spacer()
                    
                    NavigationLink(
                        destination: HomeView(),
                        label: {
                            Text("Get Started")
                                .bold()
                                .foregroundColor(.white)
                                .frame(width: 270, height: 50)
                                .background(Color.red.opacity(0.6))
                                .clipShape(
                                    Capsule()
                                )
                        })
                        .offset(y: -50)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
