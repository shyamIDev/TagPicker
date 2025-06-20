//
//  TagView.swift
//  TagPicker
//
//  Created by ie16 on 16/05/25.
//

import SwiftUI
import SKTagsPicker

struct ContentView: View {
    var body: some View {
        TagView(tags: [
            Tag(name: "SwiftUI"),
            Tag(name: "Firebase"),
            Tag(name: "CoreData SwiftUI SwiftUI SwiftUI SwiftUI SwiftUI SwiftUI SwiftUI"),
            Tag(name: "CloudKit"),
            Tag(name: "coreData"),
            Tag(name: "SwiftUI SwiftUI"),
            Tag(name: "Firebase"),
            Tag(name: "CloudKit"),
            Tag(name: "CoreData SwiftUI SwiftUI SwiftUI SwiftUI SwiftUI SwiftUI SwiftUI"),
            Tag(name: "SwiftUI"),
            Tag(name: "Firebase"),
            Tag(name: "CloudKit"),
            Tag(name: "CoreData")
        ])
    }
}
