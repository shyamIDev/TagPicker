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
    private let displayLimit = 8
    
    @State private var isExpanded = false
    
    public init(tags: [Tag], selectedTags: Binding<Set<Tag>>) {
        self.tags = tags
        self._selectedTags = selectedTags
    }
    
    var visibleTags: [Tag] {
        if isExpanded || tags.count <= displayLimit {
            return tags + (tags.count > displayLimit ? [Tag(name: "Show less")] : [])
        } else {
            let limit = displayLimit - 1
            let hiddenCount = tags.count - limit
            return Array(tags.prefix(limit)) + [Tag(name: "+\(hiddenCount) more")]
        }
    }
    
    public var body: some View {
        FlexibleView(
            availableWidth: UIScreen.main.bounds.width - 40,
            data: visibleTags,
            spacing: 10,
            alignment: .leading
        ) { tag in
            let isSpecial = tag.name.hasPrefix("+") || tag.name == "Show less"
            return Text(tag.name)
                .lineLimit(1)
                .truncationMode(.tail)
                .padding(.vertical, 8)
                .padding(.horizontal, 12)
                .background(isSpecial ? Color.orange : (selectedTags.contains(tag) ? Color.blue : Color.gray.opacity(0.2)))
                .foregroundColor(isSpecial ? .white : (selectedTags.contains(tag) ? .white : .black))
                .cornerRadius(16)
                .frame(maxWidth: 120, alignment: .leading) // Limit tag width (adjust as needed)
                .onTapGesture {
                    if isSpecial {
                        isExpanded.toggle()
                    } else {
                        if selectedTags.contains(tag) {
                            selectedTags.remove(tag)
                        } else {
                            selectedTags.insert(tag)
                        }
                    }
                }
        }
    }
}
