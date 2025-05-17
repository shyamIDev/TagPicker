//
//  TagView.swift
//  Pods
//
//  Created by ie16 on 17/05/25.
//

import SwiftUI

public struct TagView: View {
    @State private var selectedTags: Set<Tag> = []
    
    public let allTags: [Tag]
    
    public init(tags: [Tag]) {
        self.allTags = tags
    }
    
    public var body: some View {
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
