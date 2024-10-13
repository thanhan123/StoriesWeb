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
            VStack {
                ScrollView(.vertical, showsIndicators: false) {
                    PostListView(tappedPost: $tappedPost, animation: animation)
                    // To make the content can be scolled under the tabbar
                    Spacer(minLength: 120)
                }
            }

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
