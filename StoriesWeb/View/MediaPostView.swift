import SwiftUI

struct MediaPostView: View {
    let post: Post
    let likePostAction: ((String, Bool) -> Void)?

    init(post: Post, likePostAction: ((String, Bool) -> Void)? = nil) {
        self.post = post
        self.likePostAction = likePostAction
    }

    var body: some View {
        VStack {
            AsyncImage(url: post.url) { image in
                image.image?.resizable().aspectRatio(contentMode: .fill)
            }
            .frame(width: 320, height: 200)
            .clipped()

            VStack(alignment: .leading, spacing: 10) {
                Text(post.title)
                    .font(.title)
                    .fontWeight(.bold)

                Text(post.content)
                    .font(.body)
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
        .shadow(radius: 5)
        .padding(.horizontal)
    }
}

struct MediaPostView_Previews: PreviewProvider {
    static var previews: some View {
        MediaPostView(post: Post(id: "4", title: "Hello world", content: "This is a super long content of a post", like: true, url: URL(string: "https://as1.ftcdn.net/v2/jpg/06/05/54/76/1000_F_605547672_nQOyDmKUnMcwUpVDYhwM1KgUpvRxf0sR.jpg")))
    }
}
