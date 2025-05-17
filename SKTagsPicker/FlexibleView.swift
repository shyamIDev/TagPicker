//
//  FlexibleView.swift
//  TagPicker
//
//  Created by ie16 on 16/05/25.
//

import SwiftUI

public struct FlexibleView<Data: Collection, Content: View>: View where Data.Element: Hashable {
    let availableWidth: CGFloat
    let data: Data
    let spacing: CGFloat
    let alignment: HorizontalAlignment
    let content: (Data.Element) -> Content
    
    @State private var elementsSize: [Data.Element: CGSize] = [:]
    
    public init(
        availableWidth: CGFloat,
        data: Data,
        spacing: CGFloat,
        alignment: HorizontalAlignment,
        content: @escaping (Data.Element) -> Content
    ) {
        self.availableWidth = availableWidth
        self.data = data
        self.spacing = spacing
        self.alignment = alignment
        self.content = content
    }
    
    public var body: some View {
        let rows = computeRows()
        
        return VStack(alignment: alignment, spacing: spacing) {
            ForEach(rows.indices, id: \.self) { rowIndex in
                HStack(spacing: spacing) {
                    ForEach(rows[rowIndex], id: \.self) { element in
                        content(element)
                            .fixedSize()
                            .background(
                                GeometryReader { geo in
                                    Color.clear
                                        .onAppear {
                                            elementsSize[element] = geo.size
                                        }
                                }
                            )
                    }
                }
            }
        }
    }
    
    private func computeRows() -> [[Data.Element]] {
        var rows: [[Data.Element]] = [[]]
        var currentRowWidth: CGFloat = 0
        
        for element in data {
            let size = elementsSize[element, default: CGSize(width: availableWidth, height: 1)]
            
            if currentRowWidth + size.width + spacing > availableWidth {
                rows.append([element])
                currentRowWidth = size.width + spacing
            } else {
                rows[rows.count - 1].append(element)
                currentRowWidth += size.width + spacing
            }
        }
        return rows
    }
}
