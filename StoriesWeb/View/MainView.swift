//
//  MainView.swift
//  StoriesWeb
//
//  Created by Owner on 2024/06/28.
//

import SwiftUI

struct MainView: View {
    @State var selectedViewIndex = 0

    var body: some View {
        ZStack {
            Color("background").edgesIgnoringSafeArea(.all)

            TabView {
                HomeView().tabItem {
                    Label("Home", systemImage: "house")
                }
                Text("Search").tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
                Text("Like").tabItem {
                    Label("Like", systemImage: "heart")
                }
            }
        }
    }
}

#Preview {
    MainView()
}
