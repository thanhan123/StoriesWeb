//
//  PostViewDetail.swift
//  StoriesWeb
//
//  Created by Owner on 2024/10/03.
//

import Foundation

import SwiftUI

struct PostViewDetail: View {
    @Binding var post: Post?
    let likePostAction: ((String, Bool) -> Void)?
    @State private var offset = CGSize.zero
    var animation: Namespace.ID
    @State private var backgroundOpacity: Double = 1

    var body: some View {
        if let post = post {
            ZStack {
                Color.black
                    .opacity(backgroundOpacity)
                    .ignoresSafeArea()
                VStack {
                    HStack {
                        Button(action: {
                            withAnimation(.easeInOut) {
                                self.post = nil
                            }
                        }) {
                            Image(systemName: "xmark").resizable()
                                .frame(width: 32.0, height: 32.0).foregroundColor(.white)
                        }
                        .padding(EdgeInsets(top: 40, leading: 20, bottom: 0, trailing: 0))
                        Spacer()
                    }
                    Spacer()
                }
                ZStack {
                    AsyncCachedImage(url: post.url) { image in
                        image.resizable().aspectRatio(contentMode: .fill)
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 200)
                    .clipped()
                    .matchedGeometryEffect(id: post.id, in: animation)

                    VStack {
                        Spacer()

                        VStack {
                            Text(post.title)
                                .font(.title)
                                .foregroundColor(.white)
                                .fontWeight(.bold)

                            Text(post.content)
                                .font(.body)
                                .foregroundColor(.white)
                                .foregroundColor(.gray)

                            HStack {
                                Spacer()
                                Button(action: {
                                    likePostAction?(post.id, !post.like)
                                }) {
                                    HStack {
                                        Image(systemName: post.like ? "heart.fill" : "heart")
                                            .foregroundColor(post.like ? .red : .gray)
                                        Text(post.like ? "Liked" : "Like")
                                            .foregroundColor(.primary)
                                    }
                                }
                            }
                            .padding(.top, 10)
                        }
                    }
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 200)
                .offset(x: offset.width, y: offset.height) // Apply vertical offset
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            // Update the offset as the user drags
                            offset = gesture.translation
                        }
                        .onEnded { gesture in
                            // If dragged enough, dismiss the view, otherwise reset the offset
                            if gesture.translation.height > 150 {
                                withAnimation(.easeInOut) {
                                    self.post = nil
                                }
                            } else {
                                withAnimation {
                                    offset = .zero // Reset if not swiped far enough
                                }
                            }
                        }
                )
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

// struct PostViewDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        MediaPostView(post: Post(id: "4", title: "Hello world", content: "This is a super long content of a post", like: true, url: URL(string: "https://as1.ftcdn.net/v2/jpg/06/05/54/76/1000_F_605547672_nQOyDmKUnMcwUpVDYhwM1KgUpvRxf0sR.jpg")))
//    }
// }
