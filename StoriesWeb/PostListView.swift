//
//  PostList.swift
//  StoriesWeb
//
//  Created by Owner on 2024/06/29.
//

import SwiftUI

struct PostListView: View {
    private let url = URL(string: "https://as1.ftcdn.net/v2/jpg/06/05/54/76/1000_F_605547672_nQOyDmKUnMcwUpVDYhwM1KgUpvRxf0sR.jpg")
    
    var body: some View {
        VStack{
            MediaPostView(imageURL: url)
            MediaPostView(imageURL: url)
            MediaPostView(imageURL: url)
        }
    }
}

#Preview {
    PostListView()
}
