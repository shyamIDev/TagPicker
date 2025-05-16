//
//  Tag.swift
//  TagPicker
//
//  Created by ie16 on 16/05/25.
//

import Foundation

public struct Tag: Identifiable, Hashable {
    public let id = UUID()
    public let name: String

    public init(name: String) {
        self.name = name
    }
}
