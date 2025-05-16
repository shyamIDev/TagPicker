//
//  WrapView.swift
//  TagPicker
//
//  Created by ie16 on 16/05/25.
//

import SwiftUI

public struct WrapView: View {
    let tags: [Tag]
    @Binding var selectedTags: Set<Tag>

    public init(tags: [Tag], selectedTags: Binding<Set<Tag>>) {
        self.tags = tags
        self._selectedTags = selectedTags
    }

    public var body: some View {
        FlexibleView(
            availableWidth: UIScreen.main.bounds.width - 40,
            data: tags,
            spacing: 10,
            alignment: .leading
        ) { tag in
            Text(tag.name)
                .padding(.vertical, 8)
                .padding(.horizontal, 12)
                .background(selectedTags.contains(tag) ? Color.blue : Color.gray.opacity(0.2))
                .foregroundColor(selectedTags.contains(tag) ? .white : .black)
                .cornerRadius(16)
                .onTapGesture {
                    if selectedTags.contains(tag) {
                        selectedTags.remove(tag)
                    } else {
                        selectedTags.insert(tag)
                    }
                }
        }
    }
}

