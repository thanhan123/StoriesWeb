//
//  Header.swift
//  StoriesWeb
//
//  Created by Owner on 2024/10/17.
//

import SwiftUI

struct Header: View {
    @Environment(\.safeAreaInsets) private var safeAreaInsets
    @Binding var searchText: String

    var body: some View {
        VStack {
            Color.clear
                .frame(
                    height: safeAreaInsets.top
                )
            VStack {
                HStack {
                    Image(systemName: "magnifyingglass")

                    TextField("Search Posts", text: $searchText)

                    Button {} label: {
                        Image(systemName: "mic.fill")
                            .foregroundColor(.primary)
                    }
                }
                .padding(.vertical, 12)
                .padding(.horizontal, 15)
                .background {
                    RoundedRectangle(cornerRadius: 30)
                        .fill(
                            Color.customBackground
                                .shadow(.drop(color: .black.opacity(0.08), radius: 5, x: 5, y: 5))
                                .shadow(.drop(color: .black.opacity(0.05), radius: 5, x: -5, y: -5))
                        )
                }
                .padding(.bottom, 10)
            }
        }
    }
}
