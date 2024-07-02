import SwiftUI

struct MediaPostView: View {
    @State private var isLiked = false
    let imageURL: URL?
    
    var body: some View {
        VStack(alignment: .center) {
            AsyncImage(url: imageURL)
                .frame(width: 320, height: 200)
                .clipped()
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Post Title")
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("This is a description of the media post. It can be a few lines long and provide some context to the image above.")
                    .font(.body)
                    .foregroundColor(.gray)
                
                HStack {
                    Spacer()
                    Button(action: {
                        isLiked.toggle()
                    }) {
                        HStack {
                            Image(systemName: isLiked ? "heart.fill" : "heart")
                                .foregroundColor(isLiked ? .red : .gray)
                            Text(isLiked ? "Liked" : "Like")
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
        MediaPostView(imageURL: URL(string: "https://as1.ftcdn.net/v2/jpg/06/05/54/76/1000_F_605547672_nQOyDmKUnMcwUpVDYhwM1KgUpvRxf0sR.jpg"))
    }
}
