//
//  TagView.swift
//  TagPicker
//
//  Created by ie16 on 16/05/25.
//

import SwiftUI
import SKTagsPicker

struct TagView: View {
    @State private var selectedTags: Set<Tag> = []

    let allTags: [Tag] = [
        Tag(name: "SwiftUI"),
        Tag(name: "Firebase"),
        Tag(name: "CoreData"),
        Tag(name: "SwiftData"),
        Tag(name: "CloudKit"),
        Tag(name: "Realm"),
        Tag(name: "iOS"),
        Tag(name: "macOS"),
        Tag(name: "5"),
        Tag(name: "Combine"),
        Tag(name: "8"),
        Tag(name: "macOS"),
        Tag(name: "45"),
    ]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                WrapView(tags: allTags, selectedTags: $selectedTags)

                Text("Selected Tags:")
                    .font(.headline)

                ForEach(Array(selectedTags), id: \.self) { tag in
                    Text(tag.name)
                        .padding(.horizontal)
                }
            }
            .padding()
        }
    }
}
