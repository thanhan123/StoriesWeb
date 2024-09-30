//
//  Post.swift
//  StoriesWeb
//
//  Created by Owner on 2024/09/30.
//

import Foundation

struct Post: Identifiable {
    let id: String
    let title: String
    let content: String
    let like: Bool
    let url: URL?
}
