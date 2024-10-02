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

            if selectedViewIndex == 0 {
                HomeView()
            }
            TabBar(selectedIndex: $selectedViewIndex)
        }
    }
}

#Preview {
    MainView()
}
