//
//  PostListView.swift
//  StoriesWeb
//
//  Created by Owner on 2024/06/29.
//

import SwiftUI

struct PostListView: View {
    @State private var viewModel = PostListViewModel()

    var body: some View {
        VStack {
            ForEach(0 ..< viewModel.posts.count, id: \.self) { index in
                MediaPostView(post: viewModel.posts[index], likePostAction: viewModel.likePost(postId:like:))
                    .onAppear {
                        // Trigger loading more posts when the user is 3 items from the end
                        if index == viewModel.posts.count - 1 {
                            viewModel.fetchPosts()
                        }
                    }
            }
        }.onAppear {
            viewModel.fetchPosts()
        }
    }
}

extension PostListView {
    @Observable
    final class PostListViewModel {
        private(set) var posts = [Post]()
        private let postListService: PostList
        private let likePostService: LikePost
        private var latestPostId: String?

        init(postListService: PostList = PostListImpl(), likePostService: LikePost = LikePostImpl()) {
            self.postListService = postListService
            self.likePostService = likePostService
        }

        func likePost(postId: String, like: Bool) {
            Task {
                do {
                    let updatedPost = try await likePostService.like(postId: postId, like: like)
                    let targetPostIndex = posts.firstIndex { post in
                        post.id == updatedPost.id
                    }
                    guard let targetPostIndex = targetPostIndex else {
                        return
                    }
                    posts[targetPostIndex] = updatedPost
                } catch {
                    print("Failed to like post: \(error)")
                }
            }
        }

        func fetchPosts() {
            Task {
                do {
                    let postsResponse = try await postListService.fetch(fromId: latestPostId, offset: 3)
                    latestPostId = postsResponse.last?.id
                    posts.append(contentsOf: postsResponse)
                } catch {
                    print("Failed to fetch posts: \(error)")
                }
            }
        }
    }
}

#Preview {
    PostListView()
}
