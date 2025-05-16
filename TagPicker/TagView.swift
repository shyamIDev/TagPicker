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
    
    let allTags = [
        Tag(name: "SwiftUI"), Tag(name: "UIKit"), Tag(name: "Firebase"), Tag(name: "coredata"), Tag(name: "SwiftData"), Tag(name: "23")
    ]
    
    var body: some View {
        WrapView(tags: allTags, selectedTags: $selectedTags)
    }
}
