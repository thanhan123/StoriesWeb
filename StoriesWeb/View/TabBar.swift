//
//  TabBar.swift
//  StoriesWeb
//
//  Created by Owner on 2024/06/29.
//

import SwiftUI

struct TabBar: View {
    @Binding var selectedIndex: Int
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Button {
                    selectedIndex = 0
                } label: {
                    Image(systemName: selectedIndex == 0 ? "house.fill" : "house")
                        .foregroundColor(selectedIndex == 0 ?
                            Color("selected") : Color(#colorLiteral(red: 0.7, green: 0.81, blue: 0.83, alpha: 1)))
                }
                Spacer()
                Button {
                    selectedIndex = 1
                } label: {
                    Image(systemName: selectedIndex == 1 ? "magnifyingglass" : "sparkle.magnifyingglass")
                        .foregroundColor(selectedIndex == 1 ?
                            Color("selected") : Color(#colorLiteral(red: 0.7, green: 0.81, blue: 0.83, alpha: 1)))
                }
                Spacer()
                Button {
                    selectedIndex = 2
                } label: {
                    Image(systemName: selectedIndex == 2 ? "house.fill" : "house")
                        .foregroundColor(selectedIndex == 2 ?
                            Color("selected") : Color(#colorLiteral(red: 0.7, green: 0.81, blue: 0.83, alpha: 1)))
                }
                Spacer()
                Button {
                    selectedIndex = 3
                } label: {
                    Image(systemName: selectedIndex == 3 ? "heart.fill" : "heart")
                        .foregroundColor(selectedIndex == 3 ?
                            Color("selected") : Color(#colorLiteral(red: 0.7, green: 0.81, blue: 0.83, alpha: 1)))
                }
            }
            .padding(.horizontal, 40)
            .padding(.bottom, 20)
            .font(.system(size: 24))
            .frame(height: 100)
            .background(Color("background"))
            .cornerRadius(40)
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar(selectedIndex: .constant(1))
    }
}
