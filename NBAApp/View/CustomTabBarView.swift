//
//  CustomTabBarView.swift
//  NBAApp
//
//  Created by André Santana on 14/07/2021.
//

import SwiftUI

struct CustomTabBarView: View {
    @Binding var selectedTab: String

    var body: some View {
        
        HStack(spacing: 0) {
            
            //Tab Bar Button
            TabBarButton(image: "sportscourt", title: "Scores", selectedTab: $selectedTab)
            
            TabBarButton(image: "list.number", title: "Standings", selectedTab: $selectedTab)
            
            TabBarButton(image: "gearshape", title: "Settings", selectedTab: $selectedTab)
        }
        .padding(.top)
        .background(Color.white)
    }
}

struct CustomTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//Extending view to get safe area
extension View {
    func getSafeArea() -> UIEdgeInsets {
        return UIApplication.shared.windows.first?.safeAreaInsets ?? UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}

struct TabBarButton: View {
    
    var image: String
    var title: String
    @Binding var selectedTab: String
    
    var body: some View {
        
        Button(action: {
            withAnimation(.spring()) {
                selectedTab = image
            }
        }, label: {
                        
            VStack(spacing: 5) {
                Image(systemName: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 28, height: 28)
                    .foregroundColor(selectedTab == image ? Color.blue : Color.gray.opacity(0.5))
                
                Text(title)
                    .font(.caption)
                    .foregroundColor(selectedTab == image ? Color.blue : Color.gray.opacity(0.5))
            }
            .frame(maxWidth: .infinity)
            
        })
        
    }
}

