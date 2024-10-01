//
//  PostList.swift
//  StoriesWeb
//
//  Created by Owner on 2024/09/30.
//

import Foundation

protocol PostList {
    func fetch(fromId: String?, offset: Int) async throws -> [Post]
}

struct PostListImpl: PostList {
    func fetch(fromId: String?, offset: Int) async throws -> [Post] {
        // Simulate network delay
        try await Task.sleep(nanoseconds: 1000000000) // 1 second delay
        let allPostsCount = Constant.allPosts.count
        guard let fromId = fromId else {
            return Array(Constant.allPosts[0 ..< min(offset, allPostsCount)])
        }
        let fromIndex = Constant.allPosts.firstIndex { post in
            post.id == fromId
        }
        guard let fromIndex = fromIndex, fromIndex < allPostsCount - 1 else {
            return []
        }
        let startIndex = min(fromIndex + 1, allPostsCount - 1)
        let endIdnex = min(fromIndex + 1 + offset, allPostsCount)
        print("startIndex - endIndex", startIndex, endIdnex)
        return Array(Constant.allPosts[startIndex ..< endIdnex])
    }
}
