//
//  PostList.swift
//  StoriesWeb
//
//  Created by Owner on 2024/06/29.
//

import SwiftUI

struct PostListView: View {
    @State private var viewModel = PostListViewModel()
    
    var body: some View {
        VStack{
            MediaPostView(post: viewModel.posts[0], likePostAction: viewModel.updatePostLike(postId:like:))
            MediaPostView(post: viewModel.posts[1], likePostAction: viewModel.updatePostLike(postId:like:))
            MediaPostView(post: viewModel.posts[2], likePostAction: viewModel.updatePostLike(postId:like:))
        }
    }
}

extension PostListView {
    @Observable
    final class PostListViewModel {
        private(set) var posts = [
            Post(title: "New day is good", content: "New day is pretty good", like: false, url: URL(string: "https://thumbs.dreamstime.com/z/autumn-fall-nature-scene-autumnal-park-beautiful-77869343.jpg?w=992")),
            Post(title: "This evening is better", content: "Such a beautiful evening", like: true, url: URL(string: "https://as2.ftcdn.net/v2/jpg/05/56/81/55/1000_F_556815523_AYrXaaLIUESVAphY1jQ02wGJ5M8qMtTs.jpg")),
            Post(title: "Winter is coming", content: "Rain in here is always beautiful", like: false, url: URL(string: "https://as1.ftcdn.net/v2/jpg/07/28/80/58/1000_F_728805885_oPMArd8i98hEYOMt4iC0u6pxQqT4WlRh.jpg")),
        ]
        
        func updatePostLike(postId: UUID, like: Bool) {
            let index = posts.firstIndex { post in
                return post.id == postId
            }
            guard let index = index else { return }
            posts[index].like = like
        }
    }
}

#Preview {
    PostListView()
}
