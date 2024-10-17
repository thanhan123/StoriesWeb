//
//  HomeView.swift
//  StoriesWeb
//
//  Created by Owner on 2024/06/29.
//

import SwiftUI

struct HomeView: View {
    @State private var tappedPost: Post?
    @Namespace private var animation

    var body: some View {
        ZStack {
            PostListView(tappedPost: $tappedPost, animation: animation)

            if tappedPost != nil {
                PostViewDetail(post: $tappedPost, likePostAction: nil, animation: animation)
                    .transition(.opacity) // Slide in from the right
            }
        }
        .animation(.easeInOut, value: tappedPost != nil)
    }
}

#Preview {
    HomeView()
}
