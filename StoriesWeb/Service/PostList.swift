//
//  PostList.swift
//  StoriesWeb
//
//  Created by Owner on 2024/09/30.
//

import Foundation

protocol PostList {
    func fetch() async throws -> [Post]
}

struct PostListImpl: PostList {
    func fetch() async throws -> [Post] {
        // Simulate network delay
        try await Task.sleep(nanoseconds: 1000000000) // 1 second delay
        return Constant.allPosts
    }
}
