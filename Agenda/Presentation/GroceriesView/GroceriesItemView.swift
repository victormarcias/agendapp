//
//  GroceriesItemView.swift
//  Agenda
//
//  Created by Victor Marcias on 25/08/2024.
//

import SwiftUI

struct GroceriesItemView: View {
    let item: GroceryItem
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Text(item.emoji)
                .font(.title)
                .fixedSize(horizontal: false, vertical: true)
            Text(item.title)
                .font(.footnote)
                .fixedSize(horizontal: false, vertical: true)
                .minimumScaleFactor(0.60)
                .lineLimit(3)
            Spacer()
        }
        .frame(maxWidth: 80, maxHeight: 60)
        .padding(EdgeInsets(top: 30, leading: 6, bottom: 12, trailing: 6))
        .overlay(
            CheckmarkView(size: 15, isChecked: item.isChecked)
                .padding(6), alignment: .topTrailing
        )
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(.tertiary, lineWidth: 1)
        }
        .opacity(item.isChecked ? 0.65 : 1.00)
    }
}

// MARK: - Previews
#Preview {
    HStack(spacing: 20) {
        GroceriesItemView(item: .init(category: 0,
                                      title: "Detergente para vidrios",
                                      emoji: "🪟"))
        GroceriesItemView(item: .init(category: 1,
                                      title: "Desinfectante",
                                      emoji: "🧴",
                                      isChecked: true))
    }
    .previewDevice(.none)
    .previewLayout(.sizeThatFits)
}
