//
//  LikePost.swift
//  StoriesWeb
//
//  Created by Owner on 2024/09/30.
//

import Foundation

enum LikePostError: Error {
    case networkError
    case invalidData
    case unknownError
}

protocol LikePost {
    func like(postId: String, like: Bool) async throws -> Post
}

struct LikePostImpl: LikePost {
    private let allPosts = Constant.allPosts

    func like(postId: String, like: Bool) async throws -> Post {
        // Simulate network delay
        try await Task.sleep(nanoseconds: 500000000) // 0.5 second delay
        let targetPost = allPosts.first { post in
            post.id == postId
        }
        guard let targetPost = targetPost else {
            throw LikePostError.invalidData
        }
        return Post(id: targetPost.id, title: targetPost.title, content: targetPost.content, like: like, url: targetPost.url)
    }
}
