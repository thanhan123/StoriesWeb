//
//  HomeView.swift
//  StoriesWeb
//
//  Created by Owner on 2024/06/29.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                PostListView()
                // To make the content can be scolled under the tabbar
                Spacer(minLength: 120)
            }
        }
    }
}

#Preview {
    HomeView()
}
